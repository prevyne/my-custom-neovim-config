-- init.lua

require("config.options")
require("config.plugins")
require("config.lsp")
require("config.lint")
require("config.cmp")

vim.cmd("hi Normal ctermbg=NONE guibg=NONE")

-- Tell Neovim to use the terminal's colors for the base editor
vim.cmd([[
" For UI elements, you can choose to make them transparent or use terminal colors too.
  " This makes their background transparent/inherited.
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight CursorLineNr guibg=NONE ctermbg=NONE " Background of the number on the current line
  highlight FoldColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE " Separators between vertical splits
]])
