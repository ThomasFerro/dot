return {
  {
    'bluz71/vim-moonfly-colors',
    commit = 'ef85b89739bee184e204c89bc06280d62bd84039',
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme moonfly]]
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    commit = '3946f0122255bc377d14a59b27b609fb3ab25768',
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
