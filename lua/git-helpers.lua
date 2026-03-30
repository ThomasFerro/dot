local nmap = require('remap').nmap

vim.pack.add({
  {
    src = 'https://github.com/tpope/vim-fugitive',
    version = '61b51c0'
  },

  {
    src = 'https://github.com/lewis6991/gitsigns.nvim',
    version = 'c21acb929a29027e6edb123b931cdd290c675c09',
  },
})

require('gitsigns').setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  signs_staged = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  signs_staged_enable = true,
  on_attach = function(bufnr)
    nmap('<leader>hp', require('gitsigns').preview_hunk, 'Preview git hunk', bufnr)

    local gs = package.loaded.gitsigns
    vim.keymap.set({ 'n', 'v' }, ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
    vim.keymap.set({ 'n', 'v' }, '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
  end,
})
