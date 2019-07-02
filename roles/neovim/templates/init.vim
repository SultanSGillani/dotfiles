"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible
endif

let vimplug_exists=expand('{{ neovim_config_dir }}/autoload/plug.vim')

let g:sultan_vim_plugs = "{ vim_plugs|join(',') }}"
let g:sultan_vim_editor = "nvim"

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !curl -fLo {{ neovim_config_dir }}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('{{ neovim_config_dir }}/plugged'))

"*****************************************************************************
"" Plugins
"*****************************************************************************

{% for plug in plugins %}
Plug '{{ plug }}'
{% endfor %}

"" Plugs with extra commands
{% for plugin in extra_plugs %}
Plug '{{ plugin.name }}', {{ plugin.extra }}
{% endfor %}

call plug#end()

"""""""""""""""""""""""""
""""    filetypes     """
"""""""""""""""""""""""""

{% for item in filetype %}
filetype {{ item }}
{% endfor %}

""""""""""""""""""""""""""
""""   lightline      """"
""""""""""""""""""""""""""

" lightconfigs


" lightau

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

"""""""""""""""""""""""""
""""    set     """"
"""""""""""""""""""""""""

{% for item in set %}
set {{ item }}
{% endfor %}

"""""""""""""""""""""""""
""""    syntax     """"
"""""""""""""""""""""""""

{% for item in syntax %}
syntax {{ item }}
{% endfor %}

"""""""""""""""""""""""""
""""    colorscheme     """"
"""""""""""""""""""""""""

{% for item in colorscheme %}
colorscheme {{ item }}
{% endfor %}

"""""""""""""""""""""""""
""""    colors"
"""""""""""""""""""""""""

{% for item in color %}
color {{ item }}
{% endfor %}

"""""""""""""""""""""""""
""""    let     """"
"""""""""""""""""""""""""
"""""""""""""""""""""""""

{% for item in let %}
let {{ item }}
{% endfor %}

"""""""""""""""""""""""""
""""    au     """"
"""""""""""""""""""""""""

{% for item in au %}
au {{ item }}
{% endfor %}

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

{% for highlight in highlights %}
highlight {{ highlight }}
{% endfor %}

{% if ansible_facts['os_family']|lower == 'darwin' %}
"  ---------------------------------------------------------------------------
"  Mac Settings
"  ---------------------------------------------------------------------------

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Hack:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
endif

" ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar
  set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=a
  set guifont=Hack:h12
endif

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif
{% endif %}
""**************************************************************************
"" Abbreviations
""*****************************************************************************
{% for abbrev in abbr %}
cnoreabbrev {{ abbrev }}
{% endfor %}

"*****************************************************************************
"" Functions
"*****************************************************************************

" functions_marker


"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
{% for item in autocmd %}
autocmd {{ item }}
{% endfor %}

"*****************************************************************************
"" commands
"*****************************************************************************

{% for commands in command %}
command! {{ commands }}
{% endfor %}

{% for commands in command_noex %}
command {{ commands }}
{% endfor %}

"*****************************************************************************
"" Mappings
"*****************************************************************************

" inoremap_marker

{% for item in inoremap %}
inoremap {{ item }}
{% endfor %}

{% for item in noremap %}
noremap {{ item }}
{% endfor %}

{% for item in nnoremap %}
nnoremap {{ item }}
{% endfor %}

{% for item in vnoremap %}
vnoremap {{ item }}
{% endfor %}

{% for item in map %}
map {{ item }}
{% endfor %}

{% for item in xmap %}
xmap {{ item }}
{% endfor %}

{% for item in nmap %}
nmap {{ item }}
{% endfor %}

{% for item in cmap %}
cmap {{ item }}
{% endfor %}

{% for item in vmap %}
vmap {{ item }}
{% endfor %}

{% for item in imap %}
imap {{ item }}
{% endfor %}

{% for item in cnoremap %}
cnoremap {{ item }}
{% endfor %}

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" When vimrc, either directly or via symlink, is edited, automatically reload it

{% for auto in autocommand %}
autocmd! {{ auto }}
{% endfor %}

"" Include user's local vim config
if filereadable(expand("{{ neovim_config_dir }}/local_init.vim"))
  source {{ neovim_config_dir }}/local_init.vim
endif
