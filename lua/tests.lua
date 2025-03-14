local nmap = (require "remap").nmap

return {
  'vim-test/vim-test',
  commit = '0f50a54',
  config = function()
    nmap('<leader>t', ':TestNearest<CR>')
    nmap('<leader>T', ':TestFile<CR>')
    nmap('<leader>a', ':TestSuite<CR>')
    nmap('<leader>l', ':TestLast<CR>')
    nmap('<leader>g', ':TestVisit<CR>')
  end
}
