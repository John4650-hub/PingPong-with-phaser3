#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
ffmpeg -f image2 -framerate 30 -i downloads/frame%d.png -c:v h264_nvenc -preset fast -r 30 -pix_fmt yuv420p output.mp4
gh release create "$1" output.mp4
