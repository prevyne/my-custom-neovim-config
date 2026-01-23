-- In ~/.config/nvim/init.lua

-- Define leader key before loading any plugins
vim.g.mapleader = " "

--Set clipboard provider
vim.opt.clipboard = "unnamedplus"

-- General settings
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.opt.wrap = true
vim.opt.hidden = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undofiles"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.background = 'dark' -- or 'light'
vim.cmd("hi Normal ctermbg=NONE guibg=NONE")

-- Load core modules
require("core.plugins")
require("core.mappings")
require("core.lsp")

-- require('core.terminal')
--require('core.todo_highlights')
--require("core.autosave")

-- (Make sure any "print" or "vim.opt.number = true" test lines from previous troubleshooting are managed or removed if no longer needed)

-- Tell Neovim to use the terminal's colors for the base editor
vim.cmd([[
  " Clear Neovim's default background and foreground for Normal text
  " This allows the terminal's background and foreground to be used.
  highlight Normal guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE

  " Do the same for floating windows (LSP info, completion menus, etc.)
  highlight NormalFloat guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE

  " And for the characters at the end of the buffer (the '~')
  highlight EndOfBuffer guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE

  " For UI elements, you can choose to make them transparent or use terminal colors too.
  " This makes their background transparent/inherited.
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight CursorLineNr guibg=NONE ctermbg=NONE " Background of the number on the current line
  highlight FoldColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE " Separators between vertical splits

  " Optional: If you want the status line to also be transparent/use terminal colors
  " This might make it blend in a lot; adjust as per your preference.
  " highlight StatusLine guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE
  " highlight StatusLineNC guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE " For non-active windows

  " Optional: Make popup menu (completion menu) use terminal background
  " highlight Pmenu guibg=NONE ctermbg=NONE
  " highlight PmenuSel guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE " Selected item in Pmenu
  " highlight PmenuSbar guibg=NONE ctermbg=NONE " Scrollbar
  " highlight PmenuThumb guibg=NONE ctermbg=NONE
]])

-- Important Note on Neovim Version and API usage:
-- In our previous discussion, you encountered an "invalid key: guibg" error with vim.api.nvim_set_hl.
-- The vim.cmd([[ ... ]]) block above uses the traditional Vimscript highlight commands, which are generally
-- more stable across Neovim versions if you're facing API issues.

-- If you are on a newer Neovim version (e.g., 0.8+) and the vim.api.nvim_set_hl function works for you
-- without the "invalid key" error, you could use that instead:
--
-- vim.api.nvim_set_hl(0, 'Normal', { guifg = 'NONE', ctermfg = 'NONE', guibg = 'NONE', ctermbg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { guifg = 'NONE', ctermfg = 'NONE', guibg = 'NONE', ctermbg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { guifg = 'NONE', ctermfg = 'NONE', guibg = 'NONE', ctermbg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'SignColumn', { guibg = 'NONE', ctermbg = 'NONE' })
-- -- etc. for other groups

-- The autocmd can be useful to re-apply these if anything (like a plugin or syntax file)
-- tries to set colors after your initial setup.
--[[
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("UseTerminalColors", { clear = true }),
  callback = function()
    vim.cmd("highlight Normal guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NormalFloat guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE")
    vim.cmd("highlight EndOfBuffer guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE")
    -- Add other vim.cmd("highlight ...") lines here as needed
  end,
})
--]]
