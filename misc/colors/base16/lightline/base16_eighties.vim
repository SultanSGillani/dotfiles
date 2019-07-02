let s:base00 = [ '#2d2d2d',  0 ] " black
let s:base01 = [ '#393939', 18 ]
let s:base02 = [ '#515151', 19 ]
let s:base03 = [ '#747369',  8 ]
let s:base04 = [ '#a09f93', 20 ]
let s:base05 = [ '#d3d0c8',  7 ]
let s:base06 = [ '#e8e6df', 21 ]
let s:base07 = [ '#f2f0ec', 15 ] " white

let s:base08 = [ '#f2777a',  1 ] " red
let s:base09 = [ '#f99157', 16 ] " orange
let s:base0A = [ '#ffcc66',  3 ] " yellow
let s:base0B = [ '#99cc99',  2 ] " green
let s:base0C = [ '#66cccc',  6 ] " teal
let s:base0D = [ '#6699cc',  4 ] " blue
let s:base0E = [ '#cc99cc',  5 ] " pink
let s:base0F = [ '#d27b53', 17 ] " brown

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

let g:lightline#colorscheme#base16_eighties#palette = lightline#colorscheme#flatten(s:p)
