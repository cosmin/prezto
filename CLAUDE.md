# Prezto — Zsh Configuration Framework

This is a personal fork of [sorin-ionescu/prezto](https://github.com/sorin-ionescu/prezto), hosted at [cosmin/prezto](https://github.com/cosmin/prezto).

## Git Remotes

- `origin` — `git@github.com:cosmin/prezto.git` (personal fork)
- `upstream` — `git@github.com:sorin-ionescu/prezto.git` (upstream)

## Local Modifications

Custom commits on top of upstream/master:

- Module selection: git, docker, homebrew, osx, python modules enabled
- Prompt theme: garrett instead of the default sorin
- Editor: emacsclient with fallback to emacs
- iTerm2 tmux integration enabled
- Keybindings: emacs-style word navigation (forward-word, backward-word, select-word-style)
- Architecture aliases: `arm` and `intel` for switching between arm64 and x86_64
- pyenv initialization if installed
- Homebrew path detection (/opt/hb vs /opt/homebrew)
- private.zsh sourcing for machine-specific configuration
- Virtualenv auto-initialize disabled

## Private Configuration

`private.zsh` in the repo root is gitignored and used for machine-specific secrets and settings (devserver hostnames, conda init, custom PATH additions, etc). It is sourced from `runcoms/zprofile` if it exists.

## Repo Layout

- `runcoms/` — Zsh dotfiles (.zshrc, .zprofile, .zpreztorc, etc.) that get symlinked into `$HOME` by prezto's install script
- `modules/` — Prezto modules (completion, prompt, git, etc.)
- `modules/prompt/functions/prompt_garrett_setup` — Custom garrett prompt theme

## Usage

`~/.zprezto` should be a clone of this repo. The prezto install script symlinks files from `runcoms/` to `$HOME` (e.g., `~/.zshrc` -> `~/.zprezto/runcoms/zshrc`).

## Rebasing on Upstream

```sh
git fetch upstream
git rebase upstream/master
# resolve any conflicts
git push origin master --force-with-lease
```

After rebasing, also update submodules if needed:

```sh
git submodule update --init --recursive
```
