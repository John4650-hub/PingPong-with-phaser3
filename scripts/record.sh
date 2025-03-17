#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
ffmpeg -r 1/5 -i downloads/frame%d.png -c:v libx264 -vf fps=25 -pix_fmt yuv420p output.mp4
gh release create "$1" output.mp4
