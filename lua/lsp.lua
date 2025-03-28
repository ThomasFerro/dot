vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'gO')

vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semantictokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

vim.lsp.enable({ 'lua_ls', 'gopls', 'ts_ls' })

local nmap = require('remap').nmap
local lsp_nmap = function(keys, func, desc, buffer)
  if desc then
    desc = 'LSP: ' .. desc
  end
  nmap(keys, func, desc, buffer)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    lsp_nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition', event.buf)
    lsp_nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences', event.buf)
    lsp_nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation', event.buf)
    lsp_nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame', event.buf)
    lsp_nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', event.buf)

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
    lsp_nmap('<leader>cf', ':Format<cr>', '[F]ormat current buffer with LSP', event.buf)
  end,
})

return {
  {
    'williamboman/mason.nvim',
    tag = 'v1.11.0',
    config = function()
      require("mason").setup()
    end
  },
}
