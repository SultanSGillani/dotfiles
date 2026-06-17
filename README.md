[![GitHub CI](https://github.com/SultanSGillani/dotfiles/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/SultanSGillani/dotfiles/actions/workflows/ci.yml)
[![GitLab CI](https://gitlab.com/sultangillani/dotfiles/badges/main/pipeline.svg)](https://gitlab.com/sultangillani/dotfiles/-/pipelines)
[![License: ISC](https://img.shields.io/badge/license-ISC-blue.svg?style=popout-square)](https://www.isc.org/downloads/software-support-policy/isc-license)

# Dotfiles

A cross-platform development environment provisioned with [Ansible](https://www.ansible.com/). Targets **macOS** primarily (Apple Silicon and Intel) with secondary support for **Debian/Ubuntu** and **Arch Linux**.

Repo: <https://github.com/SultanSGillani/dotfiles>

> **Upgrading from a previous version?** See [CHANGELOG.md](CHANGELOG.md) for breaking changes and migration steps (rust/cargo/npm tools moved to mise).

## What it sets up

- **Shell:** zsh + [zinit](https://github.com/zdharma-continuum/zinit) plugin manager, base16 themes, fzf, Powerlevel10k, custom completions/bindings/functions
- **Runtime version manager:** [mise](https://mise.jdx.dev/) (replaces asdf) — single source of truth in [roles/mise/files/miseconfig](roles/mise/files/miseconfig). Manages:
  - **Languages:** node, python, java (zulu), dotnet, rust
  - **CLIs:** terraform, shellcheck, shfmt, skaffold
  - **Cargo backend:** eza, bat, cargo-deb (replaces brew/cargo install)
  - **npm backend (global CLIs):** prettier, eslint, typescript, pnpm, yarn, npm-check-updates, serve
- **Editor:** Neovim with vim-plug, [coc.nvim](https://github.com/neoclide/coc.nvim) (`coc-pyright`, `coc-json` auto-installed via `g:coc_global_extensions`), lightline, dracula theme, UltiSnips
- **Terminal multiplexers / WMs:** tmux, i3 (Linux), yabai + skhd + spacebar (macOS)
- **Tools:** git + hub, fzf, fd, ripgrep, bat, ranger, gcloud, rclone, docker, gpg, ssh
- **Fonts & theming:** Hack Nerd Font, base16 colorschemes, GTK config, wallpaper
- **Optional:** JetBrains IDEs (IntelliJ, PyCharm, RubyMine, WebStorm), Firefox, iTerm2, urxvt, st, termite, polybar, dunst, compton

## Layout

```
dotfiles.yml         # main entry playbook
darwin.yml           # macOS-only roles
linux.yml            # Linux-only roles
sudo.yml             # privileged tasks split off
inventory.yml        # localhost only
group_vars/all/      # shared vars (mise paths, brew_prefix, base16 themes)
roles/<name>/        # one role per tool/area
bin/                 # personal scripts on PATH
library/             # custom Ansible modules (aur, base16_builder, cmake, macos_install)
```

## Prerequisites

- macOS or Linux
- [Homebrew](https://brew.sh/) (macOS)
- Ansible **core 2.20+** and Python **3.13+**
- A `~/.vault_password.txt` file containing your Ansible vault password
- `~/.secrets` (sourced by `bin/provision`)

## Usage

Clone:

```sh
git clone git@github.com:SultanSGillani/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Run the full playbook:

```sh
bin/provision
```

Run a subset by tag (any role name works as a tag, plus the per-task tags `initial`, `update`, `pip`, `mise`, etc.):

```sh
bin/provision zsh                  # just regenerate zshrc
bin/provision mise                 # install/update tool versions
bin/provision neovim               # rerender init.vim, install plugins
bin/provision dotfiles git ssh     # multiple tags
```

The `bin/provision` wrapper handles vault-password-file, sudo prompt (`-K`), and OS detection.

## Updating tool versions

Edit [roles/mise/files/miseconfig](roles/mise/files/miseconfig), then:

```sh
bin/provision mise
```

mise is activated in zsh via `eval "$(mise activate zsh)"` (see [roles/zsh/templates/zshrc.zsh.j2](roles/zsh/templates/zshrc.zsh.j2)), so all shells pick up the new versions automatically.

### Adding tools

The `miseconfig` supports several backends — pick whichever fits:

```toml
[tools]
# core registry (preferred)
node = "24.15.0"
rust = "stable"

# cargo backend — installs from crates.io
"cargo:ripgrep" = "latest"

# npm backend — global node CLIs without polluting any project
"npm:typescript" = "latest"

# pipx backend, ubi (GitHub releases), aqua, etc. also supported
```

After editing, `bin/provision mise` will install + reshim. Run `mise outdated` to see upgrades and `ncu` (npm-check-updates) for project-level packages.

### Why mise (not brew/cargo/npm directly)

- One declarative file pinning every toolchain version per machine
- Per-project overrides via `.mise.toml` or `.tool-versions`
- Avoids the macOS brew rust/cargo signing/PATH issues that prompted this migration
- No more global `npm install -g` (no `~/node_modules`, no permission hacks)

## Custom modules in `library/`

- `aur` — Arch AUR helper wrapper (paru/yay)
- `base16_builder` — generates base16 theme files
- `cmake`, `macos_install` — small helpers used by specific roles

These are auto-loaded by Ansible because `library/` lives at the playbook root.

## Notable conventions

- Per-role OS branching: `tasks/{darwin,debian,archlinux}.yml` included from each role's `tasks/main.yml`
- Templated configs use Jinja2 (`*.j2`) under `roles/<name>/templates/`
- All tool paths derive from `mise_shims_dir` / `brew_prefix` in [group_vars/all/main.yml](group_vars/all/main.yml) — no hardcoded user paths
- `bin/` is added to `PATH` via the zsh template, exposing all personal helper scripts
- Deprecation warnings from upstream collections are silenced via `ANSIBLE_DEPRECATION_WARNINGS=False` in the per-OS `.ansible.cfg.*.template` files

## Per-role docs

Larger / more opinionated roles have their own README:

- [roles/mise/README.md](roles/mise/README.md) — toolchain config, backends, troubleshooting (codesign/Killed:9 etc.)
- [roles/zsh/README.md](roles/zsh/README.md) — zinit plugin layout, theme switching, completions sync
- [roles/neovim/README.md](roles/neovim/README.md) — coc extensions, plugin list, manual `:PlugInstall` flow

## CI

Linting runs on both GitHub Actions ([.github/workflows/ci.yml](.github/workflows/ci.yml)) and GitLab CI ([.gitlab-ci.yml](.gitlab-ci.yml)). There is no full provisioning integration test — CI only validates static correctness:

- `yamllint` against [.yamllint](.yamllint)
- `ansible-lint` against the root playbooks using [.ansible-lint](.ansible-lint)
- `ansible-playbook --syntax-check` against `dotfiles.yml`, `darwin.yml`, `linux.yml`, `sudo.yml`, `vmware.yml`

Run the same checks locally:

```sh
pip install --user ansible ansible-lint yamllint
yamllint -c .yamllint .
ansible-lint -c .ansible-lint dotfiles.yml darwin.yml linux.yml sudo.yml vmware.yml
for pb in dotfiles.yml darwin.yml linux.yml sudo.yml vmware.yml; do
  ansible-playbook -i inventory.yml --syntax-check "$pb"
done
```

## Troubleshooting

**`Killed: 9` running ansible/python on macOS** — mise's adhoc-signed python was invalidated. Re-sign:

```sh
for p in ~/.local/share/mise/installs/python/*/bin/python3.*; do codesign --force --sign - "$p"; done
```

**brew tool shadows mise shim** — make sure `~/.local/share/mise/shims` comes before `/opt/homebrew/bin` in PATH (it does in the generated zshrc). `which -a <tool>` shows the resolution order.

**`fast-theme` chatter on shell start** — the zinit ice swallows both stdout & stderr (`&>/dev/null`); if you see messages again, regenerate zshrc with `bin/provision zsh`.

## License

[ISC](LICENSE)
