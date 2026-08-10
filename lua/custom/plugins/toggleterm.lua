local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'akinsho/toggleterm.nvim' }

require('toggleterm').setup {
  size = function(term)
    if term.direction == 'horizontal' then return 15
    elseif term.direction == 'vertical' then return math.floor(vim.o.columns * 0.4) end
  end,
  open_mapping = [[<C-\>]],
  direction = 'float',
  float_opts = { border = 'curved' },
}

-- No `<esc>` -> normal-mode mapping here on purpose.
--
-- Binding a bare `<esc>` in terminal mode makes Esc unusable *inside* whatever runs in
-- the terminal — Claude Code's TUI, a nested nvim, less, fzf. kickstart already maps
-- `<Esc><Esc>` in init.lua for leaving terminal mode, which leaves single Esc to the app.
