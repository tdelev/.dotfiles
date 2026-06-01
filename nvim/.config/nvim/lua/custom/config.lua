-- User-specific overrides on top of upstream kickstart options/keymaps.
-- Anything that would otherwise cause merge conflicts with upstream
-- `lua/options.lua` or `lua/keymaps.lua` belongs here.

-- Options
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4

-- Keymaps
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Go down and center the view' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Go up and center the view' })

-- Move lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Source current Lua file
vim.keymap.set('n', '<leader>x', ':w<CR> :source<CR>', { desc = 'Execute current Lua file' })

-- Quick vertical terminal
vim.keymap.set('n', '<leader>tv', ':vs term://zsh<CR>', { desc = 'Open terminal in vertical window' })

-- System clipboard yank
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Telescope grep_string from visual selection
vim.keymap.set('x', '<leader>ss', '"zy<Cmd>lua require("telescope.builtin").grep_string({search=vim.fn.getreg("z")})<CR>')

-- Telescope find_files
vim.keymap.set('n', '<leader>p', function()
  require('telescope.builtin').find_files()
end, { desc = '[P]roject files (Telescope)' })

vim.keymap.set('n', 'gi', function()
  require('telescope.builtin').lsp_implementations()
end, { desc = '[G]oto [I]mplementation' })

vim.keymap.set('n', 'gd', function()
  require('telescope.builtin').lsp_definitions()
end, { desc = '[G]oto [I]mplementation' })

vim.keymap.set('n', '<leader>o', function()
  require('telescope.builtin').lsp_document_symbols()
end, { desc = 'Open Document Symbols' })

vim.keymap.set('n', 'gr', function()
  require('telescope.builtin').lsp_references()
end, { desc = '[G]o to [R]eferences' })
