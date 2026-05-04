vim.pack.add({
  {
    src = 'https://github.com/nvim-lualine/lualine.nvim',
    version = '131a558e13f9f28b15cd235557150ccb23f89286',
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
