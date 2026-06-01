-- Overrides on top of kickstart's neo-tree spec.
-- Lazy.nvim merges opts with the upstream spec at lua/kickstart/plugins/neo-tree.lua.
return {
  'nvim-neo-tree/neo-tree.nvim',
  opts = {
    -- When a file is opened from the tree, drop it into the last editor
    -- window instead of replacing the neo-tree buffer.
    open_files_in_last_window = true,

    -- Reuse the same editor window when neo-tree is the only thing open,
    -- otherwise neo-tree picks a new split.
    filesystem = {
      window = {
        mappings = {
          ['<cr>'] = 'open',
        },
      },
    },
  },
}
