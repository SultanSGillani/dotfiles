# mise role

Installs and configures [mise](https://mise.jdx.dev/), the runtime / toolchain version manager that replaces asdf, nvm, pyenv, rustup, and most `npm install -g` use cases in this dotfiles repo.

## What this role does

1. Installs the `mise` binary (Homebrew on macOS, official installer on Linux).
2. Renders `~/.config/mise/config.toml` from [files/miseconfig](files/miseconfig).
3. Runs `mise install` then `mise reshim` so every declared tool is on `PATH` via `~/.local/share/mise/shims`.
4. Installs Python packages via pip into the mise-managed Python (see [tasks/pip.yml](tasks/pip.yml) and `pip_packages` in [defaults/main.yml](defaults/main.yml)).

The shims directory is wired into `PATH` by the zsh role's template (`zshrc.zsh.j2`), and `eval "$(mise activate zsh)"` runs at shell start so that `cd` into a project with a `.mise.toml` automatically switches versions.

## The single config file

[files/miseconfig](files/miseconfig) is the source of truth. Sections currently in use:

```toml
[tools]
# core registry (versioned)
dotnet     = "10.0.203"
java       = "zulu-26.30.11.0"
node       = "24.15.0"
python     = "3.13.7"
rust       = "stable"
shellcheck = "0.11.0"
shfmt      = "3.13.1"
skaffold   = "2.19.0"
terraform  = "1.15.1"

# cargo backend — Rust crates as binaries
"cargo:eza"       = "latest"
"cargo:bat"       = "latest"
"cargo:cargo-deb" = "latest"

# npm backend — global node CLIs (no ~/node_modules required)
"npm:prettier"          = "latest"
"npm:eslint"            = "latest"
"npm:typescript"        = "latest"
"npm:pnpm"              = "latest"
"npm:yarn"              = "latest"
"npm:npm-check-updates" = "latest"
"npm:serve"             = "latest"
```

### Backends supported

| Prefix | Source | Use when |
|---|---|---|
| _(none)_ | mise's curated registry | Anything in the [registry](https://mise.jdx.dev/registry.html) |
| `cargo:` | crates.io | Rust binaries not on the registry |
| `npm:` | npmjs.org | Global node CLIs |
| `pipx:` | PyPI | Isolated Python apps |
| `ubi:` | GitHub releases | Prebuilt binaries from a repo |
| `aqua:` | aquaproj.github.io | Most other CLI tools |

## Common commands

```sh
mise ls                # show installed tools
mise outdated          # tools with newer versions available
mise upgrade           # bump tools (respects ranges in config)
mise install           # install everything in the active config
mise reshim            # rebuild ~/.local/share/mise/shims
mise current           # which version of each tool is active here
mise use node@22       # add/override a tool in the cwd's .mise.toml
mise which python      # actual install path behind the shim
```

To change a global default version: edit `files/miseconfig`, then `bin/provision mise` (which copies the file and runs `mise install` + `mise reshim`).

## Project-local overrides

Drop a `.mise.toml` (or `.tool-versions`) into any project:

```toml
[tools]
node = "20.11.1"
python = "3.12"
```

`cd` into the directory and the shims switch automatically. mise emits a "trust" prompt the first time; run `mise trust` to allow.

## Troubleshooting

### `Killed: 9` from any python/ansible command on macOS

Apple's kernel killed the binary because mise's ad-hoc code signature was invalidated (common after macOS upgrades or relocating `~/.local/share/mise`). Re-sign:

```sh
for p in ~/.local/share/mise/installs/python/*/bin/python3.*; do
  codesign --force --sign - "$p"
done
```

Same trick works for any other mise-installed binary that gets killed.

### A Homebrew tool is shadowing a mise shim

Check resolution order:

```sh
which -a node rustc cargo prettier
```

If anything resolves to `/opt/homebrew/bin` first, either:
- Uninstall the brew copy: `brew uninstall <tool>` (preferred when it's only there as a duplicate), or
- Confirm `~/.local/share/mise/shims` precedes `/opt/homebrew/bin` in your `$PATH` (zshrc handles this — open a new shell).

### A new tool isn't on PATH after editing miseconfig

Run `mise reshim`. The Ansible role does this automatically; you only need to do it manually if you edited `~/.config/mise/config.toml` directly without `bin/provision mise`.

### Pip packages installing to the wrong python

The role pins pip to the mise-managed python (`mise_executable` + `python` shim). If you need packages in a virtualenv instead, create the venv and install there — don't add to `pip_packages`.

## Files

- [files/miseconfig](files/miseconfig) — the only declarative config that matters
- [defaults/main.yml](defaults/main.yml) — `mise_dots` (sync list) and `pip_packages`
- [tasks/](tasks/) — per-OS install + shared `pip.yml`
- [vars/](vars/) — per-OS extra packages required to *build* python (readline, xz, unzip, …)
