let s:base00 = [ '#f9f5d7',  0 ] " black
let s:base01 = [ '#ebdbb2', 18 ]
let s:base02 = [ '#d5c4a1', 19 ]
let s:base03 = [ '#bdae93',  8 ]
let s:base04 = [ '#665c54', 20 ]
let s:base05 = [ '#504945',  7 ]
let s:base06 = [ '#3c3836', 21 ]
let s:base07 = [ '#282828', 15 ] " white

let s:base08 = [ '#9d0006',  1 ] " red
let s:base09 = [ '#af3a03', 16 ] " orange
let s:base0A = [ '#b57614',  3 ] " yellow
let s:base0B = [ '#79740e',  2 ] " green
let s:base0C = [ '#427b58',  6 ] " teal
let s:base0D = [ '#076678',  4 ] " blue
let s:base0E = [ '#8f3f71',  5 ] " pink
let s:base0F = [ '#d65d0e', 17 ] " brown

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:base00, s:base0D ], [ s:base05, s:base02 ] ]
let s:p.insert.left     = [ [ s:base01, s:base0B ], [ s:base05, s:base02 ] ]
let s:p.visual.left     = [ [ s:base00, s:base09 ], [ s:base05, s:base02 ] ]
let s:p.replace.left    = [ [ s:base00, s:base08 ], [ s:base05, s:base02 ] ]
let s:p.inactive.left   = [ [ s:base02, s:base00 ] ]

let s:p.normal.middle   = [ [ s:base07, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base01, s:base00 ] ]

let s:p.normal.right    = [ [ s:base01, s:base03 ], [ s:base06, s:base02 ] ]
let s:p.inactive.right  = [ [ s:base01, s:base00 ] ]

let s:p.normal.error    = [ [ s:base07, s:base08 ] ]
let s:p.normal.warning  = [ [ s:base07, s:base09 ] ]

let s:p.tabline.left    = [ [ s:base05, s:base02 ] ]
let s:p.tabline.middle  = [ [ s:base05, s:base01 ] ]
let s:p.tabline.right   = [ [ s:base05, s:base02 ] ]
let s:p.tabline.tabsel  = [ [ s:base02, s:base0A ] ]

let g:lightline#colorscheme#base16_gruvbox_light_hard#palette = lightline#colorscheme#flatten(s:p)
