return {
  {
    'nvim-lualine/lualine.nvim',
    commit = '47f91c416daef12db467145e16bed5bbfe00add8',
    opts = {
      options = {
        icons_enabled = false,
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
