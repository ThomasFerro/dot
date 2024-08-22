local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
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

  'tpope/vim-sleuth', 
}, {})
