return {
  {
    'nvim-treesitter/nvim-treesitter',
    commit = '8ab64a3',
    lazy = false,
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'c', 'cpp', 'c_sharp', 'terraform', 'go', 'lua', 'python', 'rust', 'tsx', 'json', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash', 'yaml' },
      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true }
    }
  }
}
