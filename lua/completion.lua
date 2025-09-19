return {
  {
    'saghen/blink.cmp',
    tag = 'v1.7.0',
    opts = {
      keymap = { preset = 'enter' },
      completion = { documentation = { auto_show = true } },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
}
