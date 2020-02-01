#!/usr/bin/env zsh

zturbo0a()   { zinit ice wait"0a" silent             "${@}"; }
zturbo0b()   { zinit ice wait"0b" silent             "${@}"; }
zturbo0c()   { zinit ice wait"0c" silent             "${@}"; }
zturbo0()   { zinit ice wait"0" silent             "${@}"; }
zturbo1a()   { zinit ice wait"1a" silent             "${@}"; }
zturbo1b()   { zinit ice wait"1b" silent             "${@}"; }
zturbo1c()   { zinit ice wait"1c" silent             "${@}"; }
zturbo1d()   { zinit ice wait"1d" silent             "${@}"; }
zturbo1e()   { zinit ice wait"1e" silent             "${@}"; }
zturbo1f()   { zinit ice wait"1f" silent             "${@}"; }
zturbo1()   { zinit ice wait"1" silent             "${@}"; }
zturbo2a()   { zinit ice wait"2a" silent             "${@}"; }
zturbo2b()   { zinit ice wait"2b" silent             "${@}"; }
zturbo2c()   { zinit ice wait"2c" silent             "${@}"; }
zturbo2d()   { zinit ice wait"2d" silent             "${@}"; }
zturbo2e()   { zinit ice wait"2e" silent             "${@}"; }
zturbo2f()   { zinit ice wait"2f" silent             "${@}"; }
zturbo2()   { zinit ice wait"2" silent             "${@}"; }
zcommand() { zinit ice wait"0b" silent as"command" "${@}"; }
zlight()  { [ -zlight $2 ] && zinit light "${@}" || zinit "${@}"; }
zsnippet() { zinit snippet                        "${@}"; }
zsvn() { zinit ice svn                        "${@}"; }
zcr() { zinit creinstall -q "${@}"; }

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
fi

# Load the secrets file
if [ -e ${HOME}/.secrets ]; then
     source ${HOME}/.secrets
fi

# load the opts files
for file in ${ZDOTDIR}/opts/*.zsh; do
  source "$file"
done

# Arch Aur
{% if ansible_facts['os_family']|lower == "archlinux" %}
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
export MAKEFLAGS="-j9 -l8"
{% endif %}

# Python
export PYTHONSTARTUP="${HOME}/.pyrc.py"

# Gpg2
export GPG_TTY=$(tty)

fast-theme default 2> /dev/null

# Z
export _Z_CMD=z
. ${ZDOTDIR}/z.sh

# GO
export GOPATH=${HOME}/go
export GOBIN=${HOME}/.asdf/shims

# GCLOUD
export CLOUDSDK_PYTHON=python3

{% if ansible_facts['os_family']|lower == "darwin" %}
export PATH="{{ zsh_path | join(":") }}:{{ zsh_mac_path }}:$PATH"
{% endif %}
{% if ansible_facts['os_family']|lower == "debian" %}
export PATH="{{ zsh_path | join(":") }}:{{ zsh_debian_path }}:$PATH"
{% elif ansible_facts['os_family']|lower == "archlinux" %}
export PATH="{{ zsh_path | join(":") }}:{{ zsh_arch_path }}:$PATH"
{% endif %}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sultan/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sultan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sultan/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sultan/google-cloud-sdk/completion.zsh.inc'; fi

##############################################################
# GLOBAL CONFIG
##############################################################

# Theme options

# PROMPT
setopt promptsubst

. ${ZDOTDIR}/prompt.zsh

# ASDF
. ${HOME}/.asdf/asdf.sh

### Browser ###
{% if ansible_facts['os_family']|lower == "darwin" %}
export BROWSER='open'
{% endif %}

case $EDITOR in
    nvim) export MANPAGER="nvim +Man!" ;;
     vim) export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man' -\"" ;;
       *) export MANPAGER='less' ;;
esac

### Temporary Files ###

if [[ ! -d "${TMPDIR}" ]]; then
  export TMPDIR="/tmp/${LOGNAME}"
  mkdir -p -m 700 "${TMPDIR}"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# Homebrew options
{% if ansible_facts['os_family']|lower == "darwin" %}
export HOMEBREW_INSTALL_BADGE="⚗️"
export HOMEBREW_NO_ANALYTICS=1
{% endif %}

# FZF
[[ -f ${HOME}/.fzf.zsh ]] && . ${HOME}/.fzf.zsh
# Base16 {{ base16.theme[default_theme]['scheme_name'] }}
# Author: {{ base16.theme[default_theme]['scheme_author'] }}

_gen_fzf_default_opts() {

local color00='#{{ base16.theme[default_theme]['base00_hex'] }}'
local color01='#{{ base16.theme[default_theme]['base01_hex'] }}'
local color02='#{{ base16.theme[default_theme]['base02_hex'] }}'
local color03='#{{ base16.theme[default_theme]['base03_hex'] }}'
local color04='#{{ base16.theme[default_theme]['base04_hex'] }}'
local color05='#{{ base16.theme[default_theme]['base05_hex'] }}'
local color06='#{{ base16.theme[default_theme]['base06_hex'] }}'
local color07='#{{ base16.theme[default_theme]['base07_hex'] }}'
local color08='#{{ base16.theme[default_theme]['base08_hex'] }}'
local color09='#{{ base16.theme[default_theme]['base09_hex'] }}'
local color0A='#{{ base16.theme[default_theme]['base0A_hex'] }}'
local color0B='#{{ base16.theme[default_theme]['base0B_hex'] }}'
local color0C='#{{ base16.theme[default_theme]['base0C_hex'] }}'
local color0D='#{{ base16.theme[default_theme]['base0D_hex'] }}'
local color0E='#{{ base16.theme[default_theme]['base0E_hex'] }}'
local color0F='#{{ base16.theme[default_theme]['base0F_hex'] }}'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"
export FZF_TMUX_HEIGHT="30%"

# ssh_agent
eval "$(ssh-agent -s)" >/dev/null
#for i in ecdsa ecdsa_work ed22519 rsa rsa_office rsa_personal rsa_work; do
#  ssh-add id_${i} 2> /dev/null
#done

# load everything but the opts and completion files
for file in ${ZDOTDIR}/functions/*.zsh; do
  source "$file"
done

WORDCHARS=${WORDCHARS//[\/]}

if (( ! ${+PAGER} )); then
  if (( ${+commands[less]} )); then
    export PAGER=less
  else
    export PAGER=more
  fi
fi

if (( ${+ztermtitle} )); then
  case ${TERM} in
    xterm*|*st)
      precmd() { print -Pn "\e]0;${ztermtitle}\a" }
      precmd  # we execute it once to initialize the window title
      ;;
  esac
fi

# aliases
{% for alias in zsh_aliases %}
{% if alias.alias != '' %}
alias '{{ alias.alias }}'="{{ alias.action }}"
{% endif %}
{% endfor %}

{% for alias in multi_aliases %}
{% if alias.alias != '' %}
alias {{ alias.alias }}={{ alias.action }}
{% endif %}
{% endfor %}

{% for alias in zsh_misc_aliases %}
{% if alias.alias != '' %}
alias '{{ alias.alias }}'="{{ alias.action }}"
{% endif %}
{% endfor %}

{% for alias in zsh_git_alias %}
{% if alias.alias != '' %}
alias '{{ alias.alias }}'="{{ alias.action }}"
{% endif %}
{% endfor %}

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# nmap aliases
{% for alias in zsh_nmap_aliases %}
{% if alias.alias != '' %}
alias '{{ alias.alias }}'="{{ alias.action }}"
{% endif %}
{% endfor %}

# ruby aliases
{% for alias in zsh_ruby_aliases %}
{% if alias.alias != '' %}
alias {{ alias.alias }}='{{ alias.action }}'
{% endif %}
{% endfor %}

# python aliases
{% for alias in zsh_python_aliases %}
{% if alias.alias != '' %}
alias {{ alias.alias }}='{{ alias.action }}'
{% endif %}
{% endfor %}

{% if ansible_facts['os_family']|lower == "archlinux" or  ansible_facts['os_family']|lower == "debian" %}
# linux only aliases
{% for alias in zsh_linux_aliases %}
{% if alias.alias != '' %}
alias '{{ alias.alias }}'="{{ alias.action }}"
{% endif %}
{% endfor %}
{% endif %}

{% if ansible_facts['os_family']|lower == "darwin" %}
# mac only aliases
{% for alias in zsh_mac_aliases %}
{% if alias.alias != '' %}
alias '{{ alias.alias }}'="{{ alias.action }}"
{% endif %}
{% endfor %}
{% endif %}

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' insert-tab pending


##############################################################
# ZINIT https://github.com/zdharma/zinit
##############################################################

ZINIT_PATH="${HOME}/.zinit"
if [[ ! -f ${ZINIT_PATH}/bin/zinit.zsh ]]; then
  if (( $+commands[git] )); then
    git clone https://github.com/zdharma/zinit.git ${ZINIT_PATH}/bin
  else
    echo 'git not found' >&2
    exit 1
  fi
fi

source ${ZINIT_PATH}/bin/zinit.zsh

if [ -f ${HOME}/.zinit/plugins/tj---git-extras/etc/git-extras-completion.zsh ]; then
    source ${HOME}/.zinit/plugins/tj---git-extras/etc/git-extras-completion.zsh
fi

# PROMPT

{% if zsh_prompt == 'agkozak' %}
zlight agkozak/agkozak-zsh-prompt
{% elif zsh_prompt == 'powerlevel10k' %}
zinit ice depth=1;
zinit light romkatv/powerlevel10k
{% elif zsh_prompt == 'alien' %}
zturbo0 pick"alien.zsh" multisrc'modules/{async,git,init,prompt,python,svn,system,theme}.zsh'
zlight eendroroy/alien
{% endif %}

# oh-my-zsh
zturbo0a
zsvn; zsnippet OMZ::plugins/python
zturbo0a
zsvn; zsnippet OMZ::plugins/virtualenv
zturbo0a
zsvn; zsnippet OMZ::plugins/archlinux
zturbo0a
zsvn; zsnippet OMZ::plugins/tmux
zturbo0a
zsvn; zsnippet OMZ::plugins/urltools
zturbo0a
zsnippet OMZ::plugins/kubectl/kubectl.plugin.zsh

zcommand cp"httpstat.sh -> httpstat" pick"httpstat"
zlight b4b4r07/httpstat

zturbo0a as"program" pick"zsh-better-npm-completion.plugin.zsh"
zlight lukechilds/zsh-better-npm-completion

{% if ansible_facts['os_family']|lower == "darwin" %}
zsvn
zsnippet OMZ::plugins/osx
{% endif %}

{% if ansible_facts['distribution']|lower == "debian" %}
zturbo0
zsnippet OMZ::plugins/debian/debian.plugin.zsh
{% endif %}

{% if ansible_facts['distribution']|lower == "ubuntu" %}
zturbo0
zsnippet OMZ::plugins/ubuntu/ubuntu.plugin.zsh
{% endif %}

# docker-compose
zinit ice as"completion" silent
zsnippet https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose

# kubectl
zinit ice as"completion" silent
zsnippet https://github.com/nnao45/zsh-kubectl-completion/blob/master/_kubectl

# docker
zinit ice as"completion" silent
zsnippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

## fzf
# Install `fzf` bynary and tmux helper script

zcommand from"gh-r";         zlight junegunn/fzf-bin
zcommand pick"bin/fzf-tmux"; zlight junegunn/fzf
# Create and bind multiple widgets using fzf
zturbo0 multisrc"shell/{completion,key-bindings}.zsh" \
        id-as"junegunn/fzf_completions" pick"/dev/null"
    zlight junegunn/fzf

# fzy
zcommand make"!PREFIX=$ZPFX install" \
    atclone"cp contrib/fzy-* $ZPFX/bin/" \
    pick"$ZPFX/bin/fzy*"
zlight jhawthorn/fzy

zturbo0a
zlight skx/sysadmin-util

zturbo0a
zlight rimraf/k

zturbo0a
zlight ael-code/zsh-colored-man-pages

zturbo0a has'git' pick'init.zsh' atload'alias gi="git-ignore"' blockf
zlight laggardkernel/git-ignore

zturbo0a make!"!PREFIX=$ZPFX" \
    atclone"cp build/def-* $ZPFX/bin/"
zlight sei40kr/zsh-fast-alias-tips

zinit ice wait silent ver"master" pick"completions/asdf.bash" nocompletions id-as"asdf-completion"
zinit light asdf-vm/asdf

#################################################################
# IMPORTANT PLUGINS
#
zturbo0b atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zlight zsh-users/zsh-history-substring-search

# History search by `Ctrl+R`
zturbo0a compile'{hsmw-*,test/*}'
zlight zdharma/history-search-multi-word

export ENHANCD_FILTER=filter

zinit ice pick"init.sh" silent \
  atload'export ENHANCD_FILTER="fzf --height 50% --reverse --ansi";export ENHANCD_DOT_SHOW_FULLPATH=1'
zinit light "b4b4r07/enhancd"


# Autosuggestions & fast-syntax-highlighting
zturbo0b atload'_zsh_autosuggest_start'
zlight zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

zturbo0b atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zlight zdharma/fast-syntax-highlighting

zinit wait silent atload"zicompinit; zicdreplay" blockf for \
zsh-users/zsh-completions

#################################################################
# REMOVE TEMPORARY FUNCTIONS
#
unset -f zturbo0
unset -f zturbo0a
unset -f zturbo0b
unset -f zturbo0c
unset -f zturbo1a
unset -f zturbo1b
unset -f zturbo1c
unset -f zturbo1d
unset -f zturbo1e
unset -f zturbo1f
unset -f zturbo1
unset -f zturbo2a
unset -f zturbo2b
unset -f zturbo2c
unset -f zturbo2d
unset -f zturbo2e
unset -f zturbo2f
unset -f zturbo2
unset -f zlight
unset -f zcommand
unset -f zsvn
unset -f zsnippet
unset -f zcr

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck disable=SC1090
[ -f ${HOME}/.localrc ] && . ${HOME}/.localrc

### After the last of the compdefs

{ # idea totally stolen from prezto
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

