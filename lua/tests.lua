local nmap = (require "remap").nmap

vim.pack.add({
  {
    src = 'https://github.com/vim-test/vim-test',
    version = '9b063a510635c052af087c470039d80843ab9929'
  }
})
nmap('<leader>Tt', ':TestNearest<CR>')
nmap('<leader>TT', ':TestFile<CR>')
nmap('<leader>Ta', ':TestSuite<CR>')
nmap('<leader>Tl', ':TestLast<CR>')
nmap('<leader>Tg', ':TestVisit<CR>')
