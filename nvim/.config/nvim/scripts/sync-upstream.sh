#!/usr/bin/env bash
# Pull the latest kickstart-modular.nvim into this dotfiles repo via git subtree.
#
# Run from anywhere inside the dotfiles repo. Conflicts will surface as normal
# git conflicts — most likely in lazy-plugins.lua. Resolve, then commit.
#
# Recovery: if anything breaks badly, the branch
#   nvim-backup-pre-resync-2026-06-01
# holds the pre-sync snapshot of the entire dotfiles tree.

set -euo pipefail

REMOTE="kickstart-upstream"
REMOTE_URL="https://github.com/dam9000/kickstart-modular.nvim.git"
BRANCH="master"
PREFIX="nvim/.config/nvim"

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "Working tree is dirty. Commit or stash before syncing." >&2
  exit 1
fi

if ! git remote get-url "$REMOTE" >/dev/null 2>&1; then
  echo "Adding remote '$REMOTE' -> $REMOTE_URL"
  git remote add "$REMOTE" "$REMOTE_URL"
fi

echo "Fetching $REMOTE/$BRANCH..."
git fetch "$REMOTE" "$BRANCH"

echo "Pulling subtree into $PREFIX..."
git subtree pull --prefix="$PREFIX" "$REMOTE" "$BRANCH" --squash

echo
echo "Done. Review the merge commit and run nvim to verify."
echo "If something looks off, you can:"
echo "  git reset --hard HEAD~1     # undo this sync"
echo "  git checkout nvim-backup-pre-resync-2026-06-01 -- $PREFIX  # restore baseline"
