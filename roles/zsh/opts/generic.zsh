### generic options and environment settings ###

autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic

autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic

setopt AUTO_RESUME

setopt INTERACTIVE_COMMENTS

setopt NO_FLOW_CONTROL

setopt CORRECT

setopt LONG_LIST_JOBS

setopt NOTIFY

setopt NO_BG_NICE

setopt NO_CHECK_JOBS

setopt NO_HUP
