#!/bin/bash

REPOS=() #INSERT REPOSITORIES HERE IN FORMAT (ex: git@github.com:username/project.git)
PROJECTS_DIR="projects"

mkdir -p "$PROJECTS_DIR"
cd "$PROJECTS_DIR" || exit 1

RED_COLOR='\033[0;31m'
LIGHT_GREEN_COLOR='\033[1;32m'

while true; do
    if [ ${#REPOS[@]} -le 0 ]; then
        echo "You have not repository saved, please add your repository"
        exit 1
    fi

    for REPO in "${REPOS[@]}"; do
        REPO_NAME=$(basename "$REPO" .git)

        if [ -d "$REPO_NAME" ]; then
            echo -e "New update available, please don't exit"
            echo -e "${LIGHT_GREEN_COLOR}Update in progress for $REPO_NAME ..."
            cd "$REPO_NAME" && git pull origin main || { echo -e "${RED_COLOR}Failed to pull $REPO_NAME"; continue; } && cd ..
        else
            echo "Download for $REPO_NAME"
            git clone "$REPO" || { echo -e "${RED_COLOR}Failed to clone $REPO_NAME"; continue; }
        fi
        echo -e "${LIGHT_GREEN_COLOR}All files were updated for $REPO_NAME"
    done
    sleep 3600
done
