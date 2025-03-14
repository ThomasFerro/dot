return {
  {
    'bluz71/vim-moonfly-colors',
    commit = 'bab11d8',
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme moonfly]]
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    commit = '02d61f5',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
}
