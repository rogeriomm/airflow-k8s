#!/usr/bin/env zsh
sudo -k
sudo rm -rf /Volumes/data/lab/{pv0001,pv0002,pv0003,pv0004}/
mkdir /Volumes/data/lab/{pv0001,pv0002,pv0003,pv0004}
sudo chown 50000 /Volumes/data/lab/{pv0001,pv0002,pv0003,pv0004}
sudo chmod g+w /Volumes/data/lab/{pv0001,pv0002,pv0003,pv0004}