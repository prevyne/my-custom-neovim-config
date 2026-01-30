-- init.lua

require("config.options")
require("config.plugins")
require("config.lsp")
require("config.lint")
require("config.cmp")

--Tell Neovim to use my custom Color Theme
vim.cmd.colorscheme("hacker_green_ultimate")

