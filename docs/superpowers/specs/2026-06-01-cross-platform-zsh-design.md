# Cross-platform zsh dotfiles

**Date:** 2026-06-01
**Scope:** zsh stow package only. (alacritty, nvim, git, vim untouched.)

## Goal

Same `~/.dotfiles` repo works unchanged on macOS and Linux. No per-machine edits to tracked files.

## Structure

```
zsh/
├── .zshrc          # common, OS-agnostic config; sources .zshrc.$DOTFILES_OS
├── .zshrc.linux    # Linux-only PATH/env (linuxbrew, /opt/* tools)
└── .zshrc.macos    # macOS-only PATH/env (homebrew shellenv)
```

`.zshrc` detects OS via `$OSTYPE` and sets `DOTFILES_OS=linux|macos`, then sources the matching file.

## Common (.zshrc)

Stays in common:
- oh-my-zsh setup, theme, plugins
- `$HOME`-relative PATHs: `~/go/bin`, `~/.local/bin`, `~/.bun/bin`, `~/gems/bin`, `~/.opencode/bin`
- conda init block (uses `$HOME`)
- mise activation
- SDKMAN init (must be last)
- `EDITOR=nvim`
- `~/.zshrc.local` sourcing (fixed typo)

## Linux (.zshrc.linux)

- `/opt/viber`, `/opt/zig-0.15.2`, `/opt/nvim-linux64/bin` on PATH
- `eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"`
- JetBrains Toolbox scripts path

## macOS (.zshrc.macos)

- Homebrew shellenv: prefer `/opt/homebrew/bin/brew` (Apple Silicon), fall back to `/usr/local/bin/brew` (Intel)
- Equivalents for nvim/zig if installed via brew — usually unnecessary since brew handles PATH

## Sourcing order

```
1. oh-my-zsh
2. common $HOME-relative PATHs
3. source .zshrc.$DOTFILES_OS   # OS-specific PATHs land here
4. conda init
5. mise activate
6. .zshrc.local                  # per-machine private
7. SDKMAN (last, per its requirement)
```

## Secrets out of repo

Move `cc_local` and `cc_azure_opus` shell functions (contain internal IP and API key) from tracked `.zshrc` into untracked `~/.zshrc.local`. The local file is already sourced.

## Typo fix

`[[ -f ~/.zhsrc.local ]] && source ~/.zhsrc.local` → `.zshrc.local`.

## README

Add Per-OS prerequisites:
- **Both:** zsh, oh-my-zsh, stow, zsh-syntax-highlighting plugin
- **Linux:** linuxbrew (optional), apt/pacman packages as needed
- **macOS:** Homebrew, `brew install stow`

## Out of scope

- alacritty cross-platform fonts/decorations
- nvim (already portable via Lua + lazy.nvim)
- Bootstrap automation / Brewfile
