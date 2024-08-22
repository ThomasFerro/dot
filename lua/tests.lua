local nmap = (require "helpers.remap").nmap

return {
  'vim-test/vim-test',
  config = function()
    nmap('<leader>t', ':TestNearest<CR>')
    nmap('<leader>T', ':TestFile<CR>')
    nmap('<leader>a', ':TestSuite<CR>')
    nmap('<leader>l', ':TestLast<CR>')
    nmap('<leader>g', ':TestVisit<CR>')
  end
}
