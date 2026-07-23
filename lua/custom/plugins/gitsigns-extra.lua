-- gitsigns is already installed by kickstart base in init.lua.
-- We re-call setup with extended options for VSCode-like inline blame
-- and the recommended keymaps from kickstart/plugins/gitsigns.lua.

require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },

  -- VSCode-like inline blame at end of line
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 300,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '   <author>, <author_time:%R> • <summary>',

  on_attach = function(bufnr)
    local gs = require 'gitsigns'
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function() gs.nav_hunk 'next' end, { desc = 'Next git [c]hange' })
    map('n', '[c', function() gs.nav_hunk 'prev' end, { desc = 'Prev git [c]hange' })

    -- Hunk actions
    map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk' })
    map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [r]eset hunk' })
    map('n', '<leader>hs', gs.stage_hunk,              { desc = 'git [s]tage hunk' })
    map('n', '<leader>hr', gs.reset_hunk,              { desc = 'git [r]eset hunk' })
    map('n', '<leader>hS', gs.stage_buffer,            { desc = 'git [S]tage buffer' })
    map('n', '<leader>hR', gs.reset_buffer,            { desc = 'git [R]eset buffer' })
    map('n', '<leader>hp', gs.preview_hunk,            { desc = 'git [p]review hunk' })
    map('n', '<leader>hi', gs.preview_hunk_inline,     { desc = 'git preview hunk [i]nline' })
    map('n', '<leader>hb', gs.blame_line,              { desc = 'git [b]lame line (popup)' })
    map('n', '<leader>hd', gs.diffthis,                { desc = 'git [d]iff against index' })
    map('n', '<leader>hD', function() gs.diffthis '@' end, { desc = 'git [D]iff against last commit' })
    map('n', '<leader>hQ', function() gs.setqflist 'all' end, { desc = 'git hunk [Q]uickfix list (all files in repo)' })
    map('n', '<leader>hq', gs.setqflist,              { desc = 'git hunk [q]uickfix list (all changes in this file)' })

    -- Toggles
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle git inline [b]lame' })
    map('n', '<leader>tw', gs.toggle_word_diff,          { desc = '[T]oggle git intra-line [w]ord diff' })
    map('n', '<leader>tD', gs.toggle_deleted,            { desc = '[T]oggle git show [D]eleted lines' })

    -- Text object
    map({ 'o', 'x' }, 'ih', gs.select_hunk, { desc = 'select git hunk' })
  end,
}
