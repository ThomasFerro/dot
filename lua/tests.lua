local nmap = (require "remap").nmap

vim.pack.add({
  {
    src = 'https://github.com/vim-test/vim-test',
    version = 'bc0e94059de40641d163516a83c63bc45c716acf'
  }
})
nmap('<leader>Tt', ':TestNearest<CR>')
nmap('<leader>TT', ':TestFile<CR>')
nmap('<leader>Ta', ':TestSuite<CR>')
nmap('<leader>Tl', ':TestLast<CR>')
nmap('<leader>Tg', ':TestVisit<CR>')
