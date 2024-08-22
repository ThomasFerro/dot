local nmap = require('remap').nmap

return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')

      local function find_git_root()
        local current_file = vim.api.nvim_buf_get_name(0)
        local current_dir
        local cwd = vim.fn.getcwd()
        if current_file == "" then
          current_dir = cwd
        else
          current_dir = vim.fn.fnamemodify(current_file, ":h")
        end

        local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")
            [1]
        if vim.v.shell_error ~= 0 then
          print("Not a git repository. Searching on current working directory")
          return cwd
        end
        return git_root
      end

      local function live_grep_git_root()
        local git_root = find_git_root()
        if git_root then
          require('telescope.builtin').live_grep({
            search_dirs = { git_root },
          })
        end
      end

      vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

      nmap('<leader>?', require('telescope.builtin').oldfiles, '[?] Find recently opened files')
      nmap('<leader><space>', require('telescope.builtin').buffers, '[ ] Find existing buffers')
      nmap('<leader>/', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, '[/] Fuzzily search in current buffer')

      nmap('<leader>gf', require('telescope.builtin').git_files, 'Search [G]it [F]iles')
      nmap('<leader>sf', require('telescope.builtin').find_files, '[S]earch [F]iles')
      nmap('<leader>sh', require('telescope.builtin').help_tags, '[S]earch [H]elp')
      nmap('<leader>sw', require('telescope.builtin').grep_string, '[S]earch current [W]ord')
      nmap('<leader>sg', require('telescope.builtin').live_grep, '[S]earch by [G]rep')
      nmap('<leader>sG', ':LiveGrepGitRoot<cr>', '[S]earch by [G]rep on Git Root')
      nmap('<leader>sd', require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics')
      nmap('<leader>sr', require('telescope.builtin').resume, '[S]earch [R]esume')
    end
  },
}
