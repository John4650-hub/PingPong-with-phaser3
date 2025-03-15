#!/bin/bash
run_number="$1"
token=$2
chmod +x scripts/*.sh
./scripts/record.sh $run_number $token
