#!/bin/bash
steamcmd +login s1m1s sBatteryhorsestaple1 +force_install_dir $HOME/starbound +app_update 211820 +workshop_download_item 211820 729426797 validate +quit
cd $HOME/starbound/mods
rm *
rm -r ./PropPack
git clone https://github.com/asperrusual/PropPack.git
$HOME/bin/mod_mover.py
