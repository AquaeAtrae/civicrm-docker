#!/usr/bin/env python3

import os
from subprocess import run

PROJECT_DIR = os.path.dirname(os.path.abspath(__file__))

run(["git", "-C", PROJECT_DIR, "pull"])
run([PROJECT_DIR + "/generate.py"])
run([PROJECT_DIR + "/build.py"])
run([PROJECT_DIR + "/publish.py"])
run(["git", "-C", PROJECT_DIR, "add", "."])
run(["git", "-C", PROJECT_DIR, "commit", "-am", "Auto-updating generated files"])
run(["git", "-C", PROJECT_DIR, "push"])
