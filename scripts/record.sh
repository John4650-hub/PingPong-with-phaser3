#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
cd downloads
find ./ -type f -name *.png -printf "file '%p'\n" > filelist.txt
cat filelist.txt
ffmpeg -f concat -i filelist.txt -framerate 30 -c:v h264_nvenc -preset fast -pix_fmt yuv420p output.mp4
cd ..
gh release create "$1" downloads/output.mp4
