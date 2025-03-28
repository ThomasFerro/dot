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

vim.lsp.enable({'lua_ls', 'gopls', 'ts_ls'})

return {
  {
    'williamboman/mason.nvim',
    tag = 'v1.11.0',
    config = function()
      require("mason").setup()
    end
  },
}
-- local nmap = require('remap').nmap
-- local lsp_nmap = function(keys, func, desc, buffer)
--   if desc then
--     desc = 'LSP: ' .. desc
--   end
--   nmap(keys, func, desc, buffer)
-- end
--
-- return {
--   {
--     'folke/lazydev.nvim',
--     commit = '2367a6c',
--     ft = 'lua',
--     opts = {
--       library = {
--         -- Load luvit types when the `vim.uv` word is found
--         { path = 'luvit-meta/library', words = { 'vim%.uv' } },
--       },
--     },
--   },
--   {
--     'neovim/nvim-lspconfig',
--     commit = '8a1529e',
--     dependencies = {
--       { 'williamboman/mason.nvim',                   tag = 'v1.11.0',    config = true },
--       { 'williamboman/mason-lspconfig.nvim',         tag = 'v1.32.0' },
--       { 'WhoIsSethDaniel/mason-tool-installer.nvim', commit = '5639d58' },
--
--       { 'j-hui/fidget.nvim',                         commit = 'd9ba6b7', opts = {} },
--
--       { 'hrsh7th/cmp-nvim-lsp',                      commit = '99290b3' },
--     },
--     config = function()
--       vim.api.nvim_create_autocmd('LspAttach', {
--         group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
--         callback = function(event)
--           lsp_nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition', event.buf)
--           lsp_nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences', event.buf)
--           lsp_nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation', event.buf)
--           lsp_nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition', event.buf)
--           lsp_nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols', event.buf)
--           lsp_nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols',
--             event.buf)
--           lsp_nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame', event.buf)
--           lsp_nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', event.buf)
--           lsp_nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration', event.buf)
--
--           local client = vim.lsp.get_client_by_id(event.data.client_id)
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
--             local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
--             vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.document_highlight,
--             })
--
--             vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.clear_references,
--             })
--
--             vim.api.nvim_create_autocmd('LspDetach', {
--               group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
--               callback = function(event2)
--                 vim.lsp.buf.clear_references()
--                 vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
--               end,
--             })
--           end
--
--
--           vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
--             vim.lsp.buf.format()
--           end, { desc = 'Format current buffer with LSP' })
--           lsp_nmap('<leader>cf', ':Format<cr>', '[F]ormat current buffer with LSP', event.buf)
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
--             lsp_nmap('<leader>th', function()
--               vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
--             end, '[T]oggle Inlay [H]ints', event.buf)
--           end
--         end,
--       })
--
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--
--       local servers = {
--         bashls = {},
--         gopls = {},
--         ts_ls = {},
--         lua_ls = {
--           settings = {
--             Lua = {
--               completion = {
--                 callSnippet = 'Replace',
--               },
--               diagnostics = { disable = { 'missing-fields' } },
--             },
--           },
--         },
--       }
--
--       require('mason').setup()
--
--       local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         'stylua',
--       })
--       require('mason-tool-installer').setup { ensure_installed = ensure_installed }
--
--       require('mason-lspconfig').setup {
--         handlers = {
--           function(server_name)
--             local server = servers[server_name] or {}
--             server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--             require('lspconfig')[server_name].setup(server)
--           end,
--         },
--       }
--     end,
--   },
-- }
