#!/bin/bash
python scripts/pyScripts/main.py
ffmpeg -framerate 30 -i downloads/frame%d.png -c:v libx264 -r 30 -pix_fmt yuv420p output.mp4
gh release create "$1" output.mp4
