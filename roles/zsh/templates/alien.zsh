# Alien Theme

colorA='000' # alpha

# Base16 colors
color00='#{{ base16.theme[default_theme]['base00_hex'] }}' # blueish grey
color01='#{{ base16.theme[default_theme]['base01_hex'] }}' # little darker then 00
color02='#{{ base16.theme[default_theme]['base02_hex'] }}' #almost the same as 00
color03='#{{ base16.theme[default_theme]['base03_hex'] }}' # dark grey
color04='#{{ base16.theme[default_theme]['base04_hex'] }}' # lighter than 03
color05='#{{ base16.theme[default_theme]['base05_hex'] }}' # light grey and default foreground
color06='#{{ base16.theme[default_theme]['base06_hex'] }}' # lighter than 05
color07='#{{ base16.theme[default_theme]['base07_hex'] }}' #lightest color almost white
color08='#{{ base16.theme[default_theme]['base08_hex'] }}' #red
color09='#{{ base16.theme[default_theme]['base09_hex'] }}' #orange
color0A='#{{ base16.theme[default_theme]['base0A_hex'] }}' #yellow
color0B='#{{ base16.theme[default_theme]['base0B_hex'] }}' #green
color0C='#{{ base16.theme[default_theme]['base0C_hex'] }}' # light cyan
color0D='#{{ base16.theme[default_theme]['base0D_hex'] }}' # blue
color0E='#{{ base16.theme[default_theme]['base0E_hex'] }}' # magenta
color0F='#{{ base16.theme[default_theme]['base0F_hex'] }}' # poop redish brown

export USE_NERD_FONT=1
export ALIEN_THEME="soft"
export ALIEN_GIT_STASH_SYM=$'\uf01c '
export ALIEN_SECTION_USER_HOST=0

export ALIEN_SECTIONS_LEFT=(
  time
  exit
  path
  vcs_branch:async
  vcs_status:async
  vcs_dirty:async
  newline
  venv
  prompt
  )
