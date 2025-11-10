local nmap = (require "remap").nmap

return {
  'vim-test/vim-test',
  commit = '2c264d2a5dddb3a7ec927e4359a2b619a8c13a8c',
  config = function()
    nmap('<leader>Tt', ':TestNearest<CR>')
    nmap('<leader>TT', ':TestFile<CR>')
    nmap('<leader>Ta', ':TestSuite<CR>')
    nmap('<leader>Tl', ':TestLast<CR>')
    nmap('<leader>Tg', ':TestVisit<CR>')
  end
}
