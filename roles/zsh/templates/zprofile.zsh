# -*- mode: sh -*-

if [[ "$OSTYPE" == darwin* && -x /usr/libexec/path_helper ]]; then
    eval "$(/usr/libexec/path_helper -s)"
fi

typeset -U path
typeset -U fpath
typeset -U manpath

# Homebrew
if [[ "$OSTYPE" == darwin* && "${+commands[brew]}" == 1 ]]; then
    BREW_PREFIX="$(brew --prefix)"

    path=( "${BREW_PREFIX}/bin"
           "${BREW_PREFIX}/sbin"
           "${path[@]}" )

    fpath=( "${BREW_PREFIX}/share/zsh/site-functions"
            "${fpath[@]}" )

    manpath=( "${BREW_PREFIX}/share/man"
              "${BREW_PREFIX}/opt/coreutils/libexec/gnuman"
              "${BREW_PREFIX}/opt/findutils/libexec/gnuman"
              "${BREW_PREFIX}/opt/gnu-sed/libexec/gnuman"
              "${BREW_PREFIX}/opt/gnu-tar/libexec/gnuman"
              "${BREW_PREFIX}/opt/grep/libexec/gnuman"
              "${manpath[@]}" )
fi

# Rust
export CARGO_HOME="${HOME}/.cargo"
path=( "${CARGO_HOME}/bin" "${path[@]}" )
if [[ "${+commands[rustc]}" == 1 ]]; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# Go
export ASDF_ROOT="${HOME}/.asdf"
export GOROOT="${HOME}/.asdf/installs/golang/1.13.7/go"
export GOPATH="${HOME}/go"
path=( "${GOROOT}/bin"
       "${ASDF_ROOT}/shims"
       "${GOROOT}/bin"
       "${path[@]}" )


# Google Cloud SDK
if [[ -n "$BREW_PREFIX" ]]; then
    export CLOUDSDK_ROOT_DIR="${BREW_PREFIX}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
fi
if [[ -z "$CLOUDSDK_ROOT_DIR" && -d "$CLOUDSDK_ROOT_DIR" ]]; then
    . "${CLOUDSDK_ROOT_DIR}/path.zsh.inc"
fi

path=( "${HOME}/.local/bin" "${path[@]}" )
fpath=( "${ZDOTDIR}/functions"
        "${ZDOTDIR}/roles/zsh/completions"
        "${fpath[@]}" )

export PATH
export FPATH
export MANPATH
