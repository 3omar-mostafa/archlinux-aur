#!/usr/bin/python3

import os
from bs4 import BeautifulSoup

base_url = "https://github.com/3omar-mostafa/manjaro"
version = os.getenv('VERSION')
url = f"{base_url}/releases/download/{version}"

html_file = "index.html"

file = BeautifulSoup(open(html_file, "r"), features="lxml")
a_tags = file.find_all("a")

extensions = [".pkg.tar.zst", ".db", ".db.tar.gz", ".files", ".files.tar.gz" ]

for a in a_tags:
    for extension in extensions:
        if a["href"].endswith(extension):
            a["href"] = f'{url}/{a["href"]}'


with open(html_file, "w", encoding='utf-8') as f:
    f.write(str(file))

