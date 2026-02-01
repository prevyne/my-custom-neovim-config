-- init.lua

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
