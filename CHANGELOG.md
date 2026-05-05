# Changelog

All notable changes to this dotfiles repo. Dates are YYYY-MM-DD.

## [Unreleased] — 2026-05-05

### ⚠️ Breaking changes

This release migrates several toolchains away from system package managers (Homebrew, pacman, apt) and onto **mise** as the single source of truth. If you are pulling these changes onto a machine that was previously provisioned, follow the [migration steps](#migration-steps) below — otherwise duplicate copies of `cargo`, `rustc`, `eza`, `bat`, etc. will linger on `PATH` and may shadow the mise-managed versions.

### Removed

- **`roles/rust/`** — entire role deleted. Rust toolchain (`rust = "stable"`) and cargo binaries (`eza`, `bat`, `cargo-deb`) are now declared in [`roles/mise/files/miseconfig`](roles/mise/files/miseconfig).
- **`bin/update-rust-nightly`** — Homebrew-cellar-based nightly switcher; obsolete with mise.
- **`roles/zsh/files/aliases/ruby_aliases.zsh`** — ruby is no longer installed by this repo.
- **`rust`** + **`eza`** brew installs (were in `roles/rust/defaults/main.yml::darwin_packages`).
- **`bat`** brew install in `roles/bat/tasks/darwin.yml` (now installed via `cargo:bat`).
- **`bat`** pacman install in `roles/bat/tasks/archlinux.yml`.
- **`rustup`** entry from `roles/arch/files/pacman.yml`.
- **`rustup_home`** group var (`group_vars/all/main.yml`).
- **`roles/mise/files/package.json`** + **`package-lock.json`** — replaced by `npm:*` entries directly in `miseconfig`.
- **`mise_dots` entries for package.json / package-lock.json** in `roles/mise/defaults/main.yml`.
- Ruby reference (`$(ruby -e 'puts Gem.user_dir')/bin`) and MacPorts paths (`/opt/local/bin`, `/opt/local/sbin`) from `roles/zsh/vars/main.yml`.
- `rust` import_role entry from [`dotfiles.yml`](dotfiles.yml) and [`tests/test.yml`](tests/test.yml).

### Added

- **mise cargo backend** for `eza`, `bat`, `cargo-deb`.
- **mise npm backend** for global node CLIs: `prettier`, `eslint`, `typescript`, `pnpm`, `yarn`, `npm-check-updates`, `serve`.
- **mise rust** (`rust = "stable"`) — replaces brew rust + brew rustup.
- `ANSIBLE_DEPRECATION_WARNINGS=False` in all `misc/files/.ansible.cfg.*.template` files (silences upstream `ansible.posix` import warnings under ansible-core 2.20).
- New per-role READMEs:
  - [`roles/mise/README.md`](roles/mise/README.md)
  - [`roles/zsh/README.md`](roles/zsh/README.md)
  - [`roles/neovim/README.md`](roles/neovim/README.md)
- `misc/iTerm2 State.itermexport` to `.gitignore`.

### Changed / fixed

- **`bin/provision` and `bin/update`** rewritten:
  - `bin/provision zsh git ssh` now passes all three tags to ansible (was previously broken — extra args were treated as positional playbook args).
  - `~/.secrets` sourcing is now optional (guarded by `[[ -f ]]`).
  - All variables quoted; shellcheck clean.
- **`roles/zsh/templates/zshrc.zsh.j2`** — multiple correctness fixes:
  - `[ -zlight $2 ]` typo → `[[ -z "$2" ]] && zinit light …`
  - `for f in $(ls …)` → `for f in "${ZDOTDIR}"/functions/*.zsh(N)` with `null_glob`
  - `ssh-agent` spawn now guarded by `[[ -z "$SSH_AUTH_SOCK" ]]`
  - `CARGO_HOME` PATH was missing `/bin` suffix
  - zinit fallback `exit 1` → `return 1` (won't kill interactive shell)
  - `fast-theme default` runs in fast-syntax-highlighting's `atload` ice; output redirected with `&>/dev/null` to silence "Missing style: recursive-base" / "Switched to theme `default'" chatter
  - `CI_NTG_USER` / `CI_NTG_TOKEN` block removed entirely
- **`roles/zsh/tasks/main.yml`** — duplicate completions sync had wrong `when:` clause (both used `!= "Darwin"`); the second is now `== "Darwin"`.
- **`roles/zsh/templates/zshenv.zsh.j2`** + **`zprofile.zsh.j2`** — `MANPAGER` consolidated to `"nvim +Man!"` in zshenv only (was set twice with conflicting values).
- **Neovim** coc extensions (`coc-pyright`, `coc-json`) moved from vim-plug into `g:coc_global_extensions` so coc manages them itself (no yarn dependency).
- **README.md** — restructured around mise; added Adding Tools, Per-role docs, Troubleshooting sections.

---

## Migration steps

Follow these on each machine that was provisioned with the previous version of this repo.

### 1. Pull the latest dotfiles

```sh
cd ~/dotfiles
git pull
```

### 2. Run the provisioner once to install new tools

```sh
bin/provision mise
```

This installs rust, npm CLIs, and cargo binaries via mise. Verify:

```sh
mise current
which -a cargo rustc eza bat prettier
# each "which" should resolve to ~/.local/share/mise/shims/<tool> first
```

### 3. Remove the now-duplicate Homebrew installs (macOS)

```sh
brew uninstall rust eza bat 2>/dev/null
brew autoremove
```

If `brew uninstall` complains about dependents, list them with `brew uses --installed rust` and decide case-by-case.

### 4. Remove the now-duplicate pacman install (Arch only)

```sh
sudo pacman -Rns rustup bat
```

### 5. Clean up old home-directory artifacts

The previous `mise` role copied `package.json` + `package-lock.json` to `$HOME` and you may have an `~/node_modules` from before. None of that is needed now:

```sh
rm -f ~/package.json ~/package-lock.json
rm -rf ~/node_modules
```

### 6. (Optional) Remove old rust state directories

```sh
rm -rf ~/.rustup           # rustup-managed; mise will recreate via its own rustup
# keep ~/.cargo — cargo still uses it for crates registry cache & the bin/ dir
```

### 7. Open a new shell

The regenerated `~/.zsh/.zshrc` puts mise shims ahead of `/opt/homebrew/bin`, so a fresh shell guarantees mise wins PATH resolution.

```sh
exec zsh
which -a node python rustc cargo prettier
```

### 8. If `Killed: 9` appears running ansible/python on macOS

mise's ad-hoc-signed python may have lost its signature. Re-sign:

```sh
for p in ~/.local/share/mise/installs/python/*/bin/python3.*; do
  codesign --force --sign - "$p"
done
```

---

## Notes for future you

- **One source of truth**: every toolchain version lives in [`roles/mise/files/miseconfig`](roles/mise/files/miseconfig). Add new tools there using the appropriate backend prefix (`cargo:`, `npm:`, `pipx:`, `ubi:`, `aqua:`, or none for the curated registry).
- **No more `npm install -g`** — use `"npm:<pkg>" = "latest"` in `miseconfig` instead. Avoids `~/node_modules` pollution and permission issues.
- **No more `cargo install`** at the user level — same idea with `"cargo:<crate>"`.
- **No more `brew install rust`** — let mise own the rust toolchain so it can co-exist with project-pinned versions via per-project `.mise.toml`.
