#!/usr/bin/python3

import os
import shutil

HOME = "/home/samri"
MOD_FOLDER = HOME + "/starbound/mods"
WORKSHOP_FOLDER = HOME + "/starbound/steamapps/workshop/content/211820"

os.chdir(WORKSHOP_FOLDER)
mod_folders = os.listdir()

for mod_folder_name in mod_folders:
  contents = "{}/{}/contents.pak".format(WORKSHOP_FOLDER, mod_folder_name)
  outcome = shutil.copy2(contents, "{}/{}.pak".format(MOD_FOLDER, mod_folder_name))
  print(outcome)

