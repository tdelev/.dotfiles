# Personal and work-related dotfiles

Created following the article https://www.jakewiesler.com/blog/managing-dotfiles

Works on both **Linux** and **macOS**. The `zsh` package auto-detects the OS
(`$OSTYPE`) and sources `~/.zshrc.linux` or `~/.zshrc.macos` accordingly.

## Installation

```bash
git clone https://github.com/tdelev/dotfiles.git ~/.dotfiles
```

## Usage

```bash
cd ~/.dotfiles
stow git
stow zsh
stow nvim
stow alacritty
stow vim
```

## Per-OS prerequisites

Common to both:
- `zsh`
- [oh-my-zsh](https://ohmyz.sh/)
- `stow`
- oh-my-zsh `zsh-syntax-highlighting` plugin

### Linux

- Optional: [linuxbrew](https://docs.brew.sh/Homebrew-on-Linux) at `/home/linuxbrew/.linuxbrew`
- Tool-specific paths in `zsh/.zshrc.linux` (`/opt/viber`, `/opt/zig-0.15.2`,
  `/opt/nvim-linux64`) — adjust to whatever is installed locally.

### macOS

- [Homebrew](https://brew.sh) — Apple Silicon (`/opt/homebrew`) and Intel
  (`/usr/local`) are both auto-detected.
- `brew install stow zsh-syntax-highlighting`

## Per-machine private config

The shell sources `~/.zshrc.local` if present. Use it for secrets, work-specific
functions, or anything that shouldn't be committed. It is not tracked by this
repo.
