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
    commit = 'a94fc68',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'filetype', 'lsp_status' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      }
    },
  },
}
