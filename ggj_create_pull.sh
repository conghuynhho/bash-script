#!/bin/bash

# This script will open github in your browser and create a pull request
repo=$1
source_branch=$2
target_branch=$3

if [ -z "$repo" ] || [ -z "$source_branch" ] || [ -z "$target_branch" ]; then
    echo "Usage: $0 <repo> <source_branch> <target_branch>"
    exit 1
fi

# Variable to store a pair of key-value for ggj repo which have $repo as key and $url as value
declare -A ggj_repos=(
    ["sf"]="surface.gogojungle.co.jp"
    ["mp"]="mypage.gogojungle.co.jp"
    ["api"]="api.gogojungle.co.jp"
)

# Check if $repo is in the list of ggj_repos
if [ -z "${ggj_repos[$repo]}" ]; then
    echo "Repo $repo is not in the list of ggj_repos"
    exit 1
fi

# Open github in your browser
open "https://github.com/gogojungle/${ggj_repos[$repo]}/compare/${target_branch}...${source_branch}"


