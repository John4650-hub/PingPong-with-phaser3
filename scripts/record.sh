#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
cd downloads
ffmpeg -framerate 30 -i frame%d.png -c:v h264_nvenc -preset fast -pix_fmt yuv420p output.mp4
cd ..

gh release create "$1" downloads/output.mp4
