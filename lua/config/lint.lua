-- Lint settings

local lint = require("lint")

lint.linters_by_ft = {
  python = { "flake8", "pycodestyle" },
}

-- When linting runs
vim.api.nvim_create_autocmd({
  "BufWritePost",   -- on save
  "InsertLeave",   -- when you stop typing
}, {
  callback = function()
    lint.try_lint()
  end,
})
