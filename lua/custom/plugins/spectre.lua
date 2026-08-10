local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  gh 'nvim-pack/nvim-spectre',
  gh 'nvim-lua/plenary.nvim',
}

require('spectre').setup {
  result_padding = '',
}

-- Spectre keeps its place: `<leader>sg` -> `<C-q>` -> `:cdo s/old/new/g | update` does
-- the same job, but commits every change sight-unseen. Spectre shows the diff first,
-- which is what you want on a repo-wide rename you cannot easily undo.
--
-- Moved off `<leader>s*` on purpose. It previously sat on `<leader>sR`, one Shift away
-- from kickstart's `<leader>sr` (Telescope resume) — a case-only collision between
-- "reopen last search" and "rewrite every match in the repo" is a trap worth removing.
-- Everything destructive now lives under its own `<leader>r` prefix.
require('which-key').add { { '<leader>r', group = '[R]eplace (spectre)', mode = { 'n', 'v' } } }

vim.keymap.set('n', '<leader>rr', function() require('spectre').toggle() end,                                 { desc = '[R]eplace: toggle spect[r]e' })
vim.keymap.set('n', '<leader>rw', function() require('spectre').open_visual { select_word = true } end,       { desc = '[R]eplace [W]ord under cursor (repo-wide)' })
vim.keymap.set('v', '<leader>rs', function() require('spectre').open_visual() end,                            { desc = '[R]eplace [S]election (repo-wide)' })
vim.keymap.set('n', '<leader>rf', function() require('spectre').open_file_search { select_word = true } end,  { desc = '[R]eplace in current [F]ile only' })
