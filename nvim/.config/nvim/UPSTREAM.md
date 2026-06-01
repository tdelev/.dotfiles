# Upstream sync

This nvim config tracks [dam9000/kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim) via `git subtree`.

## Sync command

```sh
./nvim/.config/nvim/scripts/sync-upstream.sh
```

The script:
1. Verifies a clean working tree
2. Ensures the `kickstart-upstream` remote exists
3. Fetches `master` and runs `git subtree pull --prefix=nvim/.config/nvim ... --squash`

Conflicts surface as normal git conflicts. Resolve, `git add`, `git commit`.

## File ownership

| Path                           | Owner    | Notes                                  |
|--------------------------------|----------|----------------------------------------|
| `init.lua`                     | upstream | Single tweak: `have_nerd_font = true` + `require 'custom.config'` |
| `lua/options.lua`              | upstream | Do not edit. Add overrides in `custom/config.lua`. |
| `lua/keymaps.lua`              | upstream | Do not edit. Add keymaps in `custom/config.lua`.   |
| `lua/lazy-plugins.lua`         | shared   | Knowingly diverges (enables neo-tree, `custom.plugins` import, local plugin). Expect occasional conflicts. |
| `lua/lazy-bootstrap.lua`       | upstream | Do not edit.                           |
| `lua/kickstart/**`             | upstream | Do not edit.                           |
| `lua/custom/config.lua`        | user     | Personal option + keymap overrides.    |
| `lua/custom/plugins/*.lua`     | user     | Auto-imported by `{ import = 'custom.plugins' }`. |
| `scripts/sync-upstream.sh`     | user     | This sync mechanism.                   |
| `UPSTREAM.md`                  | user     | This doc.                              |

## Recovery

The branch `nvim-backup-pre-resync-2026-06-01` holds the full pre-sync snapshot of the dotfiles repo. If a sync goes badly:

```sh
# Undo the most recent sync commit
git reset --hard HEAD~1

# Or restore the nvim subtree to the pre-sync baseline
git checkout nvim-backup-pre-resync-2026-06-01 -- nvim/.config/nvim
```

## Cadence

Run the sync script as often as you like — once a month is fine. After each sync, open nvim and run `:Lazy sync` to bring plugins to the versions kickstart expects.
