local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'coder/claudecode.nvim' }

require('claudecode').setup {}

vim.keymap.set('n', '<leader>cc', '<cmd>ClaudeCode<CR>',          { desc = '[C]laude [C]ode toggle' })
vim.keymap.set('n', '<leader>cf', '<cmd>ClaudeCodeFocus<CR>',     { desc = '[C]laude [F]ocus' })
vim.keymap.set('n', '<leader>cr', '<cmd>ClaudeCodeResume<CR>',    { desc = '[C]laude [R]esume session' })
vim.keymap.set('n', '<leader>cC', '<cmd>ClaudeCodeContinue<CR>',  { desc = '[C]laude [C]ontinue last' })
vim.keymap.set('n', '<leader>cb', '<cmd>ClaudeCodeAdd %<CR>',     { desc = '[C]laude add current [B]uffer' })
vim.keymap.set('v', '<leader>cs', '<cmd>ClaudeCodeSend<CR>',      { desc = '[C]laude [S]end selection' })
vim.keymap.set('n', '<leader>ca', '<cmd>ClaudeCodeDiffAccept<CR>',{ desc = '[C]laude [A]ccept diff' })
vim.keymap.set('n', '<leader>cd', '<cmd>ClaudeCodeDiffDeny<CR>',  { desc = '[C]laude [D]eny diff' })
