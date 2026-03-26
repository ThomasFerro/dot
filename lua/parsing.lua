return {
  {
    'nvim-treesitter/nvim-treesitter',
    commit = '1970f0d3bbb99c7659e58914948749437c7b7398',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local parsers = { 'c', 'cpp', 'c_sharp', 'terraform', 'go', 'lua', 'python', 'rust', 'tsx', 'json', 'javascript',
        'typescript', 'vimdoc', 'vim', 'bash', 'yaml' }
      require('nvim-treesitter').install(parsers)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then return end

          if not vim.treesitter.language.add(language) then return end
          vim.treesitter.start(buf, language)

          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end
  }
}
