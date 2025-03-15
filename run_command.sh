#!/bin/bash
run_number="$1"
chmod +x scripts/*.sh
./scripts/record.sh $run_number
