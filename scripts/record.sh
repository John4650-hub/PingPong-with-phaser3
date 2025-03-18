#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
ls -a downloads/ > files.txt
#ffmpeg -framerate 24 -i downloads/*.png -c:v h264_nvenc -preset fast -pix_fmt yuv420p output.mp4
gh release create "$1" files.txt
