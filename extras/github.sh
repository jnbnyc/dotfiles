#!/usr/bin/env bash
# https://developer.github.com/v3/orgs/teams/

GITHUB_TOKEN=$(cat ~/.github-token)

alias ghd='cd $WORKSPACE_GITHUB'

# function clone https://github.com/org|user/repo.git
function clone {
    __DIR=$WORKSPACE/$(echo $1 | sed -E "s@(https://|.git)@@g" | xargs dirname)
    if [ -d "$__DIR" ]; then
      return 1
    else
      mkdir $__DIR
    fi
    cd $__DIR
    git clone $1
    cd -
}

function github-clone {
    git clone https://github.com/$1.git $2;
}

# functions for github.com/johnbuhay
function buhay-clone { git clone https://github.com/johnbuhay/$1.git; }

function buhay-create {
    curl -X POST -u johnbuhay \
        -d "{\"name\": \"$1\" }" https://api.github.com/user/repos
}


function get_github_team_id() {
    curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/orgs/$GITHUB_ORG/teams
}

echo 'Loaded github shortcuts'
