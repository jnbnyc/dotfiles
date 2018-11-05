alias t='terraform'
# sometimes i typo things
alias terrafrom='terraform'

# example input: terraform-delete bootkube
function terraform-delete {
    _REM=$(\
      jq ".Modules[]|select(.Root == \"modules/$1\")|.Dir" \
      .terraform/modules/modules.json)
    # replace all occurrences, use ${parameter//pattern/string}
    [ -n $_REM ] || rm -r ${_REM//\"/}
    # remove the module registered in .terraform/modules/modules.json
    jq -c "del(.Modules[]|select(.Root==\"modules/$1\"))" \
      .terraform/modules/modules.json \
      > .terraform/modules/modules.json
}

echo 'Loaded terraform shortcuts'
