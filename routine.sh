#!/bin/bash
gitsh
git add .
echo "message required to commit: "
read msg
git commit -m "$msg"
git push
