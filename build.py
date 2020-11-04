#!/usr/bin/env python

import json
from subprocess import run
from variables import php_releases

# better to 'cache' here than via `docker build --no-cache`
for php_release in php_releases:
    command = ["docker", "pull", php_release]

image = "michaelmcandrew/civicrm"
combos = json.load(open("combos.json"))

for key, combo in combos.items():
    command = ["docker", "build", combo["dir"]]
    for tag in combo["tags"]:
        command.extend(["--tag", f"{image}:{tag}"])
    run(command)

