# Powerlevel theme

colorA='000' # alpha

# Base16 colors
color00='#{{ base16.theme[default_theme]['base00_hex'] }}' # blueish grey
color01='#{{ base16.theme[default_theme]['base01_hex'] }}' # little darker then 00
color02='#{{ base16.theme[default_theme]['base02_hex'] }}' # almost the same as 00
color03='#{{ base16.theme[default_theme]['base03_hex'] }}' # dark grey
color04='#{{ base16.theme[default_theme]['base04_hex'] }}' # lighter than 03
color05='#{{ base16.theme[default_theme]['base05_hex'] }}' # light grey and default foreground
color06='#{{ base16.theme[default_theme]['base06_hex'] }}' # lighter than 05
color07='#{{ base16.theme[default_theme]['base07_hex'] }}' # lightest color almost white
color08='#{{ base16.theme[default_theme]['base08_hex'] }}' # red
color09='#{{ base16.theme[default_theme]['base09_hex'] }}' # orange
color0A='#{{ base16.theme[default_theme]['base0A_hex'] }}' # yellow
color0B='#{{ base16.theme[default_theme]['base0B_hex'] }}' # green
color0C='#{{ base16.theme[default_theme]['base0C_hex'] }}' # light cyan
color0D='#{{ base16.theme[default_theme]['base0D_hex'] }}' # blue
color0E='#{{ base16.theme[default_theme]['base0E_hex'] }}' # magenta
color0F='#{{ base16.theme[default_theme]['base0F_hex'] }}' # poop redish brown

typeset -g POWERLEVEL9K_MODE='nerdfont-complete'

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir node_version command_execution_time)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(pyenv rbenv vcs)

# Segment colors
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=${color00} # blue_grey
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=${color07} # lightest color almost white


typeset -g POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=${color0D} # blue
typeset -g POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=${color00} # blue grey

typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=${color03} # Dark Grey
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=${color07} # almost white

typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=${color07} # loght grey
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=${color00} # blue

typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=${color00} # default background blue grey
typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=${color0E} # magenta

typeset -g POWERLEVEL9K_PYENV_BACKGROUND=${color0B} # green
typeset -g POWERLEVEL9K_PYENV_FOREGROUND=${color00} # blue grey

typeset -g POWERLEVEL9K_RBENV_BACKGROUND=${color08} # red
typeset -g POWERLEVEL9K_RBENV_FOREGROUND=${color00} # default background blue grey

typeset -g POWERLEVEL9K_VCS_DIRTY_FOREGROUND=${color00} # blue grey
typeset -g POWERLEVEL9K_VCS_DIRTY_BACKGROUND=${color0F} # poop brown
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=${color00} # blue grey
typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=${color0D} # blue
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=${color00} # blue grey
typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=${color0A} # yellow
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=${color00} # blue grey
typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=${color09} #orange
typeset -g POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=${color0A} # yellow
typeset -g POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=${color00} # blue grey

typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND='000' #alpha
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=${color0B} # green
typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND='196' #red
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=${color0A} # yellow
typeset -g POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND=${color08} # red
typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=${color0A} # yellow
typeset -g POWERLEVEL9K_LOAD_WARNING_BACKGROUND=${color0A} # yellow
typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND='000' #alpha
typeset -g POWERLEVEL9K_LOAD_NORMAL_BACKGROUND=${color0B} # green
typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND='000' #alpha

## Double-Lined Prompt
typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true

## Pyenv
typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=true

## Rbenv
typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=true

## Is writable
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true

##-----Icon Set

typeset -g POWERLEVEL9K_ANDROID_ICON=$'\uf17b ' # or '\ue70e' 
typeset -g POWERLEVEL9K_APPLE_ICON=$'\uf179 ' #
typeset -g POWERLEVEL9K_AWS_EB_ICON=$'\uf270 ' # or 
typeset -g POWERLEVEL9K_AWS_ICON=$'\uf1b3 ' # or $'\ue7ad' 
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_ICON=$'\uf013 ' #
typeset -g POWERLEVEL9K_BATTERY_ICON=$'\uf241 ' # or $'\uf240 ' 
typeset -g POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\u21b5' # ↵
typeset -g POWERLEVEL9K_DISK_ICON=$'\uf0a0 ' #
typeset -g POWERLEVEL9K_EXECUTION_TIME_ICON="Due" #or $'\uf252 ' 
typeset -g POWERLEVEL9K_FAIL_ICON='\u2718' #✘
typeset -g POWERLEVEL9K_FREEBSD_ICON="BSD" #or 
#typeset -g POWERLEVEL9K_GO_ICON=$'\ue724' # or $'\ue626' 
#typeset -g POWERLEVEL9K_HOME_ICON=$'\uf015 ' #
#typeset -g POWERLEVEL9K_HOME_SUB_ICON=$'\uf07c ' #

typeset -g POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=$'\uf105' # or $'\uf12d' 
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0b0' # 
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0b1' # 

typeset -g POWERLEVEL9K_LINUX_ICON=$'\uf17c ' #
typeset -g POWERLEVEL9K_LOAD_ICON=$'\uf524 ' # or L or $'\uf140 ' 
typeset -g POWERLEVEL9K_LOCK_ICON=$'\ue0a2' #
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
typeset -g POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX='├─'
typeset -g POWERLEVEL9K_NETWORK_ICON=$'\uf012 ' # or $'\uf1fe ' 
typeset -g POWERLEVEL9K_NODE_ICON=$'\ue24f' # ⬢
typeset -g POWERLEVEL9K_OK_ICON=$'\u2714' #✔ or $'\uf00c ' 
typeset -g POWERLEVEL9K_PUBLIC_IP_ICON=$'\uf080 ' # or $'\uf469'  or 
typeset -g POWERLEVEL9K_PYTHON_ICON=$'\uf81f' #
typeset -g POWERLEVEL9K_RAM_ICON=$'\uf2db ' # or $'\uf0e4 ' 
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0b2' #
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\ue0b3' #
typeset -g POWERLEVEL9K_ROOT_ICON="\uf0e7 Root" # or \uf292 
typeset -g POWERLEVEL9K_RUBY_ICON=$'\ue791' # or $'\ue739' 
typeset -g POWERLEVEL9K_RUST_ICON=$'\ue7a8' #
typeset -g POWERLEVEL9K_SERVER_ICON=$'\uf233 ' # or $'\uf473' 
typeset -g POWERLEVEL9K_SSH_ICON="(ssh)" #$uf120'  or $'\ue795' 
typeset -g POWERLEVEL9K_SUNOS_ICON=$'\uf185 ' #
typeset -g POWERLEVEL9K_SWAP_ICON=$'\uf0c7 ' # or $'\uf109 ' 
typeset -g POWERLEVEL9K_SWIFT_ICON=$'\ue755' #
#typeset -g POWERLEVEL9K_SYMFONY_ICON=$'\ue757' #
typeset -g POWERLEVEL9K_TEST_ICON=$'\ue29a ' #
typeset -g POWERLEVEL9K_TODO_ICON=$'\uf046 ' #
typeset -g POWERLEVEL9K_VCS_BOOKMARK_ICON=$'\uf02e' # or $'\uf097'  or $'\uf08d'  or $'\uf223'  or ☿
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=$'\uf126 ' # or $'\ue702'  or 
typeset -g POWERLEVEL9K_VCS_COMMIT_ICON="-o-" # or $'\ue729' 
typeset -g POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=$'\uf171 ' # or $'\uf172 '  or $'\ue703' 
typeset -g POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 ' # or $'\uf09b '  or $'\uf092 ' 
typeset -g POWERLEVEL9K_VCS_GIT_GITLAB_ICON=$'\uf296 ' #
typeset -g POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d3 ' # or $'\uf1d2' 
typeset -g POWERLEVEL9K_VCS_HG_ICON=$'\uf223 ' # or 
typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf063' # or $'\uf01a'  or $'\uf0ab'  or $'\ud727'  or $'\u2193' ↓
typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf062' # or $'\uf01b'  or $'\uf0aa'  or $'\ue726'  or $'\u2191' ↑
typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=$'\uf061' # or $'\uf18e'  or $'\uf0a9'   or $'\ue725'  or →
typeset -g POWERLEVEL9K_VCS_STAGED_ICON=$'\uf067' #✚ or $'\uf055'  or $'\uf0fe' 
typeset -g POWERLEVEL9K_VCS_STASH_ICON=$'\uf01c' # or $'\uf192'  or ⍟
typeset -g POWERLEVEL9K_VCS_SVN_ICON="SVN" #$'\ue268'  or 
typeset -g POWERLEVEL9K_VCS_TAG_ICON=$'\uf02c ' #
typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf111 ' # or $'\uf06a'  or $'\uf12a'  or $'\uf071'  or '\u25CF' ●
typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf128 ' # or $'\uf059'  $'\uf29c'  or $'\u00b1' ?
typeset -g POWERLEVEL9K_VPN_ICON="(vpn)"
typeset -g POWERLEVEL9K_WINDOWS_ICON=$'\uf17a ' #

##-----Others Set
## Command-Execution-time set
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2

#typeset -g POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
#typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
