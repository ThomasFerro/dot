local nmap = (require "remap").nmap

return {
  'vim-test/vim-test',
  commit = '5ee3c0b',
  config = function()
    nmap('<leader>Tt', ':TestNearest<CR>')
    nmap('<leader>TT', ':TestFile<CR>')
    nmap('<leader>Ta', ':TestSuite<CR>')
    nmap('<leader>Tl', ':TestLast<CR>')
    nmap('<leader>Tg', ':TestVisit<CR>')
  end
}
