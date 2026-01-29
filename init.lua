-- init.lua

require("config.options")
require("config.plugins")
require("config.lsp")
require("config.lint")
require("config.cmp")

--Tell Neovim to use my custom Color Theme
vim.cmd.colorscheme("hacker_green_ultimate")

--vim.cmd("hi Normal ctermbg=NONE guibg=NONE")

-- Tell Neovim to use the terminal's colors for the base editor
vim.cmd([[
"This allows the Terminal's oreground and background usable." 
highlight Normal guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE

" For UI elements, you can choose to make them transparent or use terminal colors too.
" This makes their background transparent/inherited.
highlight SignColumn guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight CursorLineNr guibg=NONE ctermbg=NONE " Background of the number on the current line
  highlight FoldColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE " Separators between vertical splits
]])
