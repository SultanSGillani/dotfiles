let s:base00 = [ '#20201d',  0 ] " black
let s:base01 = [ '#292824', 18 ]
let s:base02 = [ '#6e6b5e', 19 ]
let s:base03 = [ '#7d7a68',  8 ]
let s:base04 = [ '#999580', 20 ]
let s:base05 = [ '#a6a28c',  7 ]
let s:base06 = [ '#e8e4cf', 21 ]
let s:base07 = [ '#fefbec', 15 ] " white

let s:base08 = [ '#d73737',  1 ] " red
let s:base09 = [ '#b65611', 16 ] " orange
let s:base0A = [ '#ae9513',  3 ] " yellow
let s:base0B = [ '#60ac39',  2 ] " green
let s:base0C = [ '#1fad83',  6 ] " teal
let s:base0D = [ '#6684e1',  4 ] " blue
let s:base0E = [ '#b854d4',  5 ] " pink
let s:base0F = [ '#d43552', 17 ] " brown

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

let g:lightline#colorscheme#base16_atelier_dune#palette = lightline#colorscheme#flatten(s:p)
