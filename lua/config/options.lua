vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

--For Djnago template detection
vim.filetype.add({
  pattern = {
    [".*%.html"] = "htmldjango",
  },
})