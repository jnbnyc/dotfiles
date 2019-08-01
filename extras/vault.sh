
function __vault_edit {
  set -eo pipefail
  VAULT_PATH="$1"
  _DIRNAME=/tmp/we/$(dirname $VAULT_PATH)
  mkdir -p $_DIRNAME
  CURRENT_VERSION=$(mktemp /tmp/we/$VAULT_PATH.XXX) || exit 1
  NEW_VERSION=$(mktemp /tmp/we/$VAULT_PATH.XXX) || exit 1

  $VAULT_BIN read -format=json $VAULT_PATH | jq .data >> $CURRENT_VERSION
  cp $CURRENT_VERSION $NEW_VERSION

  vim $NEW_VERSION
  # verify output is json
  cat $NEW_VERSION | jq . > /dev/null
  # verify output does not equal input
  diff -s $CURRENT_VERSION $NEW_VERSION && exit 1

  DATETIME=$(date -u +"%Y%m%d%H%M%S")
  $VAULT_BIN write /versions/$VAULT_PATH/$DATETIME @$CURRENT_VERSION > /dev/null
  $VAULT_BIN write /versions/$VAULT_PATH/previous @$CURRENT_VERSION > /dev/null \
    && rm $CURRENT_VERSION
  $VAULT_BIN write $VAULT_PATH @$NEW_VERSION \
    && rm $NEW_VERSION

  find $_DIRNAME -type f # -exec rm {} \;
}

function __vault_help {
    case $1 in
    # )
    #   shift
    #   echo help will go here
    # ;;
    *)
      echo help will go here
    ;;
  esac
}

function __vault_vault {
    echo vault $@
    $VAULT_BIN $@
}

function wework-vault {
  #  get environment variables from file
  source ${HOME}/.we/vault

  case $1 in
    auth)
      VAULT_AUTH_GITHUB_TOKEN=$(head -1 ${HOME}/.github-token) \
      $VAULT_BIN auth -method=github
    ;;
    auth-check)
      $VAULT_BIN read -field=AUTHENTICATED /freeforall/cli/check
    ;;
    edit)
      shift
      __vault_edit $@
    ;;
    read|list)
      __vault_vault $@
    ;;
    *)
    $VAULT_BIN $@
      # __vault_help
    ;;
  esac

  # cleanup
  unset VAULT_ADDR
  unset VAULT_CACERT
  unset VAULT_BIN
}
