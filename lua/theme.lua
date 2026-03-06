return {
  {
    'bluz71/vim-moonfly-colors',
    commit = 'd11b3d04cc1cb71a778d67a4df73283a5a6d66f4',
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme moonfly]]
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    commit = '47f91c416daef12db467145e16bed5bbfe00add8',
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
