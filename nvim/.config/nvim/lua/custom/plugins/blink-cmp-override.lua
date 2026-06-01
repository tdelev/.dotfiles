-- Overrides on top of kickstart's blink-cmp spec.
-- Lazy.nvim merges opts with the upstream spec at lua/kickstart/plugins/blink-cmp.lua.
return {
  'saghen/blink.cmp',
  opts = {
    keymap = {
      preset = 'enter',
    },
  },
}
