-- lua/config/plugins.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy.nvim if not installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Cyberpunk theme
  {
    "rockerBOO/boo-colorscheme-nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("boo")
    end,
  },

  -- LSP
  "neovim/nvim-lspconfig",

  -- Mason
  {
    "williamboman/mason.nvim",
    config = true,
  },
  "williamboman/mason-lspconfig.nvim",

  -- Linting
  "mfussenegger/nvim-lint",

    -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },


})
