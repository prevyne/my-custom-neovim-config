-- lua/config/lsp.lua
-- Neovim 0.11+ native LSP configuration

-- Mason setup
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "pyflakes", "clangd",
   "html", "emmet_ls", "djlint"},
})

--local lspconfig = require("lspconfig")

local function get_python_path()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return venv .. "/bin/python"
  end

  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    return cwd .. "/.venv/bin/python"
  end

  return "python3"
end

-- LSP attach behavior
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { noremap = true, silent = true, buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { desc = 'Fuzzy find files' })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})

-- Native pyright server configuration.
vim.lsp.config("pyright", {
  settings = {
    python = {
      pythonPath = get_python_path(),
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

-- Enable the pyright server
vim.lsp.enable("pyright")

--Clang server configuration
vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { ".git", "compile_commands.json", "Makefile" },
})

--Enable clang server
vim.lsp.enable("clangd")

-- Diagnostics UI
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

--Formatting + Linting for Django
--Recomended Stach (I'll install them via Mason, ...later):
  --Black -> Formatting
  --isort -> Imports
  --ruff -> Linting (Modern and fast)

--vim.lsp.config.ruff.setup({})
