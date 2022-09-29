import json5
packages_aur = json5.load(open('packages_aur.json', 'r'))

packages = []

for j in packages_aur:
    if not j.get('meta'):
        packages.append(j['name'])
    
    if j.get("conflictdepends"):
        packages += j.get("conflictdepends").split(' ')


with open('packages_aur.txt', 'w') as f:
    f.write('\n'.join(packages))
