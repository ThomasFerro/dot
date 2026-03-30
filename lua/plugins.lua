require 'theme'
require 'tests'
require 'git-helpers'
require 'completion'
require 'key-mappings'
require 'comments'
require 'string-manipulation'
require 'finder'
require 'parsing'
require 'lsp'

vim.pack.add({
  {
    src = 'https://github.com/tpope/vim-sleuth',
    version = 'be69bff'
  }
}, {})
