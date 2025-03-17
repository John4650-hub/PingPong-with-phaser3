#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
ffmpeg -framerate 24 -i downloads/frame%d.png -c:v libx264 output.mp4
gh release create "$1" output.mp4
