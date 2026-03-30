vim.pack.add({
  {
    src = 'https://github.com/folke/which-key.nvim',
    version = 'v3.17.0',
  },
})
require('which-key').add {
  { '<leader>c', group = '[C]ode' },
  { '<leader>d', group = '[D]ocument' },
  { '<leader>r', group = '[R]ename' },
  { '<leader>s', group = '[S]earch' },
  { '<leader>g', group = '[G]it' },
  { '<leader>w', group = '[W]orkspace' },
  { '<leader>t', group = '[t]oggle' },
  { '<leader>T', group = '[T]ests' },
  { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } } }
