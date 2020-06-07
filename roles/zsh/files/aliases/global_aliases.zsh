### Git ###
alias git=hub
### Bat ###
alias cat=bat
### Exa ###
alias ls='exa -bh ${${${ABSD#0}:+-G}:---color=auto}'
alias l="ls"
alias l.="ls -d .*"
alias lA="ls -a"
alias la="ls -a"
alias ll="ls -lbt created"
### Gpg ###
alias gpg=gpg2
### Neovim ###
alias vim=nvim
### Rsync ###
alias rsync="noglob rsync --verbose --progress --human-readable --compress
    --archive --hard-links --one-file-system --acls --xattrs"
alias 'rsync-copy'=rsync
alias 'rsync-move'="rsync --remove-source-files"
alias 'rsync-update'="rsync --update"
alias 'rsync-synchronize'="rsync --update --delete"
alias cpv="command rsync --"
alias visudo="sudo EDITOR=/usr/bin/nvim visudo"