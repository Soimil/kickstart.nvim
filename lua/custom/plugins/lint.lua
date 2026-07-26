local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'mfussenegger/nvim-lint' }

local lint = require('lint')
lint.linters_by_ft = {
  php             = { 'phpcs' },
  javascript      = { 'eslint_d' },
  typescript      = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
  elixir          = { 'credo' },
  css             = { 'stylelint' },
  scss            = { 'stylelint' },
}

local lint_augroup = vim.api.nvim_create_augroup('custom-lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    if vim.opt_local.modifiable:get() then lint.try_lint() end
  end,
})

vim.keymap.set('n', '<leader>tl', function() lint.try_lint() end, { desc = '[T]rigger [L]int' })
