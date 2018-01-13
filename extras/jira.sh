#!/usr/bin/env bash

# aliases for jira-cli
# alias jira='jira-cli'

# functions for jira-cli
function j { jira-cli $@; }
function jcomment     { jira-cli update $1 --comment; }
function jnewtask     { jira-cli new --project $1 --type task --description "$3" --assignee ${4:=john.buhay} "$2"; }
function jnewbug      { jira-cli new --project $1 --type bug  --description "$3" --assignee ${4:=john.buhay} "$2"; }
function jassign      { jira-cli update $1 --assign $2; }
function jview        { jira-cli view $@; }
function jopen        { open $JIRA_URL/browse/$1; }
function jt           { jira-cli update $1 --transition $2; }
function jtstart      { jt $1 'start progress'; }
function jtstop       { jt $1 'stop progress'; }
function jtresolve    { jt $1 'resolve' || jt $1 'Resolve Issue'; }
function jtclose      { jt $1 'close' || jt $1 'close issue'; }
function jfilter      { jira-cli view --filter $1; }
function joneline     { jira-cli view --filter $1 --oneline; }
function jfindt       { jira-cli list transitions --issue=$1; }

echo 'Loaded jira shortcuts'
