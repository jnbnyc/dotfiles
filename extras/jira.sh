#!/usr/bin/env bash

# # aliases for go-jira
# alias j='jira'

# # functions for go-jira
# # function j { jira-cli $@; }
# function jira-list-transitions { jira 2>&1 | grep ransition; }


# function jcomment     { jira comment -m "$@"; }
# function jnewtask     { jira create --noedit -i task --project $1 "$2"; }
# # --assignee ${4:=john.buhay}
# # function jnewbug      { jira new --project $1 --type bug  --description "$3" --assignee ${4:=john.buhay} "$2"; }
# function jassign      { jira --assign ${2:---default} $1; }
# function jview        { jira $1; }
# function jopen        { jira browse $1; }
# function jt           {
#     case $1:
#       acknowledge|backlog|close|done|in-progress|reopen|resolve|start|stop|todo)
#         jira $1 $2
#       ;;
#       *)
#         jira transitions $1
#       ;;
#     esac
# }

# function j1line       { jira $1 --template ; }

# echo 'Loaded jira shortcuts'
