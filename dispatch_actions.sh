#!/bin/bash

# Variables
REPO_OWNER="JamyJones"
REPO_NAME="Heavy-runner"
WORKFLOW_ID="main.yml" # or the workflow file name

GITHUB_TOKEN="$(cat ~/.secrets/git_token_jamy)"
REF="recoder" # The branch to run the workflow on

# Trigger the workflow dispatch
curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/actions/workflows/$WORKFLOW_ID/dispatches \
  -d '{"ref":"'"$REF"'"}'
echo "triggered"
sleep 1
