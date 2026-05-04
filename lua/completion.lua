vim.pack.add({
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = 'v1.10.2',
  }
})

require('blink.cmp').setup({
  keymap = { preset = 'enter' },
  completion = { documentation = { auto_show = true } },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" }
})
