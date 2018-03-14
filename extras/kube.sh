
alias k='kubectl'

# kubectl does not do globbing or directories natively
# for example: ${HOME}/.kube/conf.d/*config
function set_kubeconfig {
    KUBECONFIG=${HOME}/.kube/config
    KUBE_PATH=$(find ${HOME}/.kube/conf.d -type f -or -type l | tr '\n' ':')
    echo ".kubeconfig:${KUBE_PATH%?}:${KUBECONFIG}"
}

export KUBECONFIG=$(set_kubeconfig)

echo 'Loaded kubernetes shortcuts'

# %? will drop the last character from the parameter, in this case ':'
# https://www.gnu.org/software/bash/manual/bashref.html#Shell-Parameter-Expansion
