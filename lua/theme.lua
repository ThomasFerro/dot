vim.pack.add({
  {
    src = 'https://github.com/nvim-lualine/lualine.nvim',
    version = '221ce6b2d999187044529f49da6554a92f740a96',
  }
})

require('lualine').setup({
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
})
