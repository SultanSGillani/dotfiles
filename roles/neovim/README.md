# neovim role

Installs Neovim and provisions a [vim-plug](https://github.com/junegunn/vim-plug)-based config with [coc.nvim](https://github.com/neoclide/coc.nvim) for LSP/completion, plus a curated plugin set, snippets, and the Dracula colorscheme.

## What this role does

1. Installs `neovim` (Homebrew on macOS, package manager on Linux).
2. Renders [templates/init.vim.j2](templates/init.vim.j2) to `~/.config/nvim/init.vim`, looping over plugin lists from [vars/plugs.yml](vars/plugs.yml).
3. Renders the `let g:*` settings file from [vars/let.yml](vars/let.yml).
4. Installs vim-plug if missing, then runs `:PlugInstall` headlessly.
5. coc auto-installs its own extensions on first launch via `g:coc_global_extensions`.

## Plugin layout

[vars/plugs.yml](vars/plugs.yml) has two lists:

- `plugins:` — simple `'org/repo'` entries.
- `extra_plugs:` — entries that need an options dict (e.g. `'do': ':GoInstallBinaries'`, `'branch': 'release'`, `'for': 'requirements'`).

The Jinja template iterates both.

## coc extensions (managed by coc, not vim-plug)

[vars/let.yml](vars/let.yml) sets:

```vim
let g:coc_global_extensions = ['coc-pyright', 'coc-json']
```

When nvim starts the first time, coc downloads and installs these on its own. Adding more extensions = append to that list and restart nvim. **Don't** add them as vim-plug plugins — coc-* extensions need a node runtime managed by coc itself, and mixing the two led to yarn / install errors in the past.

To list/update from inside nvim:

```vim
:CocList extensions
:CocUpdate
```

## Notable plugins

| Plugin | Purpose |
|---|---|
| `itchyny/lightline.vim` + `mike-hearn/base16-vim-lightline` | Status line themed to base16 |
| `chriskempson/base16-vim` + `dracula/vim` | Colorschemes |
| `junegunn/fzf` + `junegunn/fzf.vim` | Fuzzy finder |
| `preservim/nerdtree` + `jistr/vim-nerdtree-tabs` | File tree |
| `tpope/vim-fugitive` + `airblade/vim-gitgutter` | Git |
| `SirVer/ultisnips` + `honza/vim-snippets` + `phenomenes/ansible-snippets` | Snippet engine |
| `sheerun/vim-polyglot` | Pack of language syntax plugins |
| `Yggdroot/indentLine` | Visible indent guides |
| `tpope/vim-commentary` | Comment toggle |
| `xolox/vim-session` | Session save/restore |

## Updating

After editing `vars/plugs.yml` or any template:

```sh
bin/provision neovim
```

To update plugins themselves (without re-running ansible):

```sh
nvim +PlugUpdate +qall
```

To clean removed plugins:

```sh
nvim +PlugClean! +qall
```

## Things that broke before

- **`g:indentLine_concealcursor = 0`** caused a type error — must be a string. Now `'inc'`.
- **coc-pyright via vim-plug** didn't work because coc expects to manage its own extensions. Moved to `g:coc_global_extensions`.
- **Wrong coc-pyright org** — it's `fannheyward/coc-pyright`, not `neoclide/coc-pyright` (the latter doesn't exist).
- **Yarn missing** prevented coc from installing extensions on a fresh box. Now node (via mise) handles it; no yarn dependency.
- **Broken Jinja** in `init.vim.j2` after a refactor — fixed by quoting plugin names properly in the loop.

## Files of interest

- [templates/init.vim.j2](templates/init.vim.j2) — the rendered nvim entrypoint
- [vars/plugs.yml](vars/plugs.yml) — plugin lists
- [vars/let.yml](vars/let.yml) — `g:*` settings (incl. `coc_global_extensions`)
- [vars/set.yml](vars/set.yml) — `set` options
- [files/](files/) — UltiSnips snippets and any static config copied verbatim
