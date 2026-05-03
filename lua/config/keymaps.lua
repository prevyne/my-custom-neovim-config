-- keymaps.lua

-- Fuzzy find files
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>')
-- Fuzzy find changes
vim.keymap.set('n', '<leader>fc', '<cmd>FzfLua changes<cr>')
-- Fuzzy find color scheme
vim.keymap.set('n', '<leader>fcs', '<cmd>FzfLua colorschemes<cr>')

-- live_grep: Search word instances across the codebase
vim.keymap.set('n', '<leader>lg', '<cmd>FzfLua live_grep<cr>')

-- Clear the results after search
vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<cr>')

-- Compile C programs with F5
vim.keymap.set('n', '<F5>', function()
  local file = vim.fn.expand('%')
  if file == '' then
    print("Save the file first!")
    return
  end
  local output = vim.fn.expand('%:r')
  vim.cmd('w')
  vim.cmd('!' .. 'gcc ' .. file .. ' -o ' .. output)
end, { desc = 'Compile C program' })

-- Execute C programs with F6
vim.keymap.set('n', '<F6>', function()
  local output = vim.fn.expand('%:r')
  if output == '' then
    print("No executable to run. Compile first!")
    return
  end
  vim.cmd('!' .. './' .. output)
end, { desc = 'Run compiled C program' })
