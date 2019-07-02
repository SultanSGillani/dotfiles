# Base16 Default Dark
# Author: Chris Kempson (http://chriskempson.com)

set -l color00 '#181818'
set -l color01 '#282828'
set -l color02 '#383838'
set -l color03 '#585858'
set -l color04 '#b8b8b8'
set -l color05 '#d8d8d8'
set -l color06 '#e8e8e8'
set -l color07 '#f8f8f8'
set -l color08 '#ab4642'
set -l color09 '#dc9656'
set -l color0A '#f7ca88'
set -l color0B '#a1b56c'
set -l color0C '#86c1b9'
set -l color0D '#7cafc2'
set -l color0E '#ba8baf'
set -l color0F '#a16946'

set -U FZF_DEFAULT_OPTS "
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"
