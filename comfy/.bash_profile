export COMFY_PATH="/Users/skypark/Documents/Comfy"
export CORDOVA_PATH="$COMFY_PATH/CordovaApp"

# *********** Go ************

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# ***************************

alias cdsdk='cd $GOPATH/src/github.com/BuildingRobotics/comfy-sdk'

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

export WORKON_HOME=$HOME/.virtualenvs

source /usr/local/bin/virtualenvwrapper.sh
export NODE_ENV=development
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)


export LDFLAGS="-L/opt/local/lib"
export CPPFLAGS="-I/opt/local/include/openssl"

source ~/git-completion.bash

export HELM_HOME=~/.helm

export PATH="$HOME/.poetry/bin:$PATH"

rpc() {
    workon comfy
    cd ~/documents/comfy/comfy
    API_MODE=True python manage.py rpc_server
}


cprep() {
    cd $CORDOVA_PATH
    rm -rf platforms/ plugins/
    cordova prepare
}

alias buildios='cd $COMFY_PATH; ./build_app.sh -sa -d'


ksn() {
    kubectl config set-context $(kubectl config current-context) --namespace=$1
}
ksc() {
    kubectl config use-context $1
}
get-pod-name-by-service() {
  kubectl get pods -l service=$1 -o jsonpath='{.items[0].metadata.name}' | head -n 1
}
generate-staging-links() {
  ksc prod.aws.uswest1.k8s.local
  ksn staging
  POD=$(get-pod-name-by-service dash)
  kubectl exec -it $POD -- python dashboards/urls.py
}


[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v nvm &> /dev/null; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
fi

# ****************** nvm ******************
# look for version defined in .nvmrc
# and automatically set node version on visiting a directory

find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

cdnvm(){
    cd "$@";
    nvm_path=$(find-up .nvmrc | tr -d '[:space:]')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
            nvm install "$nvm_version";
        elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}
alias cd='cdnvm'
# ****************** nvm end *****************