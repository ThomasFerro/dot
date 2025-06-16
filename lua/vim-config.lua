vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.netrw_liststyle = 3

vim.o.swapfile = false
vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<A-Down>', ":m .+1<CR>==", { desc = "Move one line down" })
vim.keymap.set('n', '<A-Up>', ":m .-2<CR>==", { desc = "Move one line down" })
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

vim.keymap.set('n', '<A-j>', ":m .+1<CR>==", { desc = "Move one line down" })
vim.keymap.set('n', '<A-k>', ":m .-2<CR>==", { desc = "Move one line down" })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

local nmap = require('remap').nmap
nmap('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
nmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
nmap('<leader>e', vim.diagnostic.open_float, 'Open floating diagnostic message')
nmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostics list')
