local nmap = require('remap').nmap

local makeFzfNative = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') and vim.fn.executable 'make' == 1 then
    vim.system({ 'make' }, { cwd = ev.data.path })
  end
end
vim.api.nvim_create_autocmd('PackChanged', { callback = makeFzfNative })

vim.pack.add({
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
    version = '74b06c6c75e4eeb3108ec01852001636d85a932b',
  },
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = '506338434fec5ad19cb1f8d45bf92d66c4917393'
  },
  {
    src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    version = '6fea601bd2b694c6f2ae08a6c6fab14930c60e2c'
  }
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup()

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
