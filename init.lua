-- init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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

require("config.options")
require("config.plugins")
require("config.lsp")
require("config.lint")
require("config.cmp")

--Tell Neovim to use my custom Color Theme
vim.cmd.colorscheme("hacker_green_ultimate")

--Transparent bg
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })   
