#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
ffmpeg  -i downloads/frame%d.png -c:v libx264  -pix_fmt yuv420p output.mp4
gh release create "$1" output.mp4
