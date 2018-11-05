# osx brew alternative
# tool management

__LOCAL_DIR=/usr/local/bin

function pkg {
  case $1 in
    version)
      shift
      __version $@
    ;;
    *)
      __help
    ;;
  esac
}

function __help {
    case $1 in
    version)
      shift
      echo help will go here
    ;;
    *)
      echo help will go here
    ;;
  esac

}

# pkg version tool
function __version {
    case $1 in
    "set")
      shift
      __version_set $@
    ;;
    ""|-h|--help)
      __help version
    ;;
    *)
      __version_get $@
    ;;
  esac
}

function __version_get {
    ls -l $__LOCAL_DIR/$1 | awk '{print $8 " -> " $10}' | sed "s|$__LOCAL_DIR/||g"
    ls -1 $__LOCAL_DIR/$1-* | sed 's|/usr/local/bin/||'
}

function __version_set {
    ln -sf $__LOCAL_DIR/$1-$2 $__LOCAL_DIR/$1
}
