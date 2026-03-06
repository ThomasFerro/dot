return {
  {
    'nvim-treesitter/nvim-treesitter',
    commit = '1970f0d3bbb99c7659e58914948749437c7b7398',
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
