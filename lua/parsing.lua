local updateAfterInstallOrUpdate = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
    vim.api.nvim_input(":TSUpdate<CR>")
  end
end
vim.api.nvim_create_autocmd('PackChanged', { callback = updateAfterInstallOrUpdate })

vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = '1970f0d3bbb99c7659e58914948749437c7b7398',
  }
})

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

