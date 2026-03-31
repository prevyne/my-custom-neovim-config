-- init.lua

vim.g.mapleader = ' '

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

vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>')

--Tell Neovim to use my custom Color Theme
vim.cmd.colorscheme("hacker_green_ultimate")

--Transparent bg
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })   

-- Compile with F5
vim.keymap.set('n', '<F5>', function()
  local file = vim.fn.expand('%')
  if file == '' then
    print("Save the file first!")
    return
  end
  local output = vim.fn.expand('%:r')
  vim.cmd('w')
  vim.cmd('!' .. 'gcc ' .. file .. ' -o ' .. output)
end, { desc = 'Compile C file' })

-- Execute with F6
vim.keymap.set('n', '<F6>', function()
  local output = vim.fn.expand('%:r')
  if output == '' then
    print("No executable to run. Compile first!")
    return
  end
  vim.cmd('!' .. './' .. output)
end, { desc = 'Run compiled C program' })
