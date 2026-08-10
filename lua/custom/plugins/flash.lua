local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'folke/flash.nvim' }
require('flash').setup {}

-- Flash only pays off as a single-keystroke motion. Behind a `<leader>` prefix it is
-- slower than plain `/`, so it is mapped to `s` / `S` (upstream flash.nvim convention).
--
-- What we give up: `s` (= `cl`) and `S` (= `cc`), both trivially replaceable.
-- What we gain: these work in operator-pending mode too, so `ds<target>` / `ys<target>`
-- turn any on-screen position into an operator target.
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash jump' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash treesitter select' })
vim.keymap.set('c', '<C-s>', function() require('flash').toggle() end, { desc = 'Toggle flash search' })
