local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--depth=1',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=v11.17.5',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'theme',
  require 'tests',
  require 'git-helpers',
  require 'completion',
  require 'key-mappings',
  require 'comments',
  require 'string-manipulation',
  require 'finder',
  require 'parsing',
  require 'lsp',

  {
    'tpope/vim-sleuth',
    commit = 'be69bff'
  }
}, {})
