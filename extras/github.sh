#!/usr/bin/env zsh
# https://developer.github.com/v3/orgs/teams/

GITHUB_TOKEN=$(cat ~/.github-token)

function github-clone { git clone https://github.com/$1.git $2; }
alias ghcl='github-clone'

# functions for jnbnyc-github
function jnbnyc-clone  { git clone https://github.com/jnbnyc/$1.git; }  #  ssh config specifies which key to use
function jnbnyc-create { curl -X POST -u jnbnyc -d "{\"name\": \"$1\" }" https://api.github.com/user/repos; }


function get_github_team_id() {
    curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/orgs/$GITHUB_ORG/teams
}
