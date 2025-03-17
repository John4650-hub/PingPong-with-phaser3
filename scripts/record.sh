#!/bin/bash
python scripts/pyScripts/main.py
ulimit -s 500000
ffmpeg -f image2 -i downloads/frame%d.png output.mp4
gh release create "$1" -c copy output.mp4
