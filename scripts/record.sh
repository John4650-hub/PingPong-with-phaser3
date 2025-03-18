#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
cd downloads
imageCount=$(find ./ -type f -name "*.png" | wc -l)
files=()
for i in $(seq 1 $imageCount); do
  files+="frame$i.png"
done
ffmpeg -framerate 30 -i "${files[@]}" -c:v h264_nvenc -preset fast -pix_fmt yuv420p output.mp4
cd ..
gh release create "$1" downloads/output.mp4
