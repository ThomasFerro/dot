return {
  {
    'nvim-treesitter/nvim-treesitter',
    commit = 'c3ecec5',
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
