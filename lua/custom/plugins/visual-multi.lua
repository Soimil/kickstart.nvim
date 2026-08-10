local gh = require('custom.plugins._helpers').gh

vim.g.VM_default_mappings = 0
vim.g.VM_maps = { ['Find Under'] = '' }
vim.g.VM_add_cursor_at_pos_no_mappiong = 1

vim.pack.add { gh 'mg979/vim-visual-multi' }

-- Kept, but deliberately behind a `<leader>` prefix rather than on `<C-n>`.
--
-- Most of what multi-cursor is used for is already covered, and covered better, by
-- `.` with `n`, by macros (`qa…q` then `@a`), and by `:g/pattern/norm ...` — those
-- scale to 10 000 lines and are repeatable; visual cursors are neither. VM stays for
-- the cases where seeing every edit site at once genuinely helps, which is why the
-- default mappings are off (`VM_default_mappings = 0` above) and it never steals a key.
require('which-key').add {
  { '<leader>m',  group = '[M]ulti cursor' },
  { '<leader>ma', '<Plug>(VM-SelectAll)<Tab>',         desc = 'Select All',          mode = 'n' },
  { '<leader>mr', '<Plug>(VM-StartRegex-Search)',      desc = 'Start Regex Search',  mode = 'n' },
  { '<leader>mp', '<Plug>(VM-Add-Cursor-At-Pos)',      desc = 'Add Cursor At Pos',   mode = 'n' },
  { '<leader>mo', '<Plug>(VM-Toggle-Mappings)',        desc = 'Toggle Mappings',     mode = 'n' },
}
