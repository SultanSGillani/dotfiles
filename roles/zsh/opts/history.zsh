### Configures history options

HISTFILE="${HOME}/.zhistory"

HISTSIZE=1000000
SAVEHIST=$HISTSIZE

HISTORY_IGNORE='(clear|c|pwd|exit|* --help|[bf]g *|l[alsh]#( *)#|less *)'

setopt BANG_HIST

setopt HIST_EXPIRE_DUPS_FIRST

setopt EXTENDED_HISTORY

setopt INC_APPEND_HISTORY

setopt SHARE_HISTORY

setopt HIST_IGNORE_DUPS

setopt HIST_IGNORE_ALL_DUPS

setopt HIST_IGNORE_SPACE

setopt HIST_SAVE_NO_DUPS

setopt HIST_VERIFY
