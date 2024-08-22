return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- TODO: Si je garde ces plugins pour LSP, remplacer par lazydev.nvim
      'folke/neodev.nvim',
    },
    config = function()
      local nmap = require('remap').nmap

      local on_lsp_attach = function(_, bufnr)
        local lsp_nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          nmap(keys, func, desc, bufnr)
        end

        lsp_nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        lsp_nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        lsp_nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        lsp_nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        lsp_nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        lsp_nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        lsp_nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        lsp_nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        lsp_nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        lsp_nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        lsp_nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        lsp_nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        lsp_nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        lsp_nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
        lsp_nmap('<leader>cf', ':Format<cr>', '[F]ormat current buffer with LSP')
      end

      require('mason').setup()
      require('mason-lspconfig').setup()

      local servers = {
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_lsp_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end,
      }
    end
  },
}
