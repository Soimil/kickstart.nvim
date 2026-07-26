local gh = require('custom.plugins._helpers').gh

vim.g.VM_default_mappings = 0
vim.g.VM_maps = { ['Find Under'] = '' }
vim.g.VM_add_cursor_at_pos_no_mappiong = 1

vim.pack.add { gh 'mg979/vim-visual-multi' }

require('which-key').add {
  { '<leader>m',  group = '[M]ulti cursor' },
  { '<leader>ma', '<Plug>(VM-SelectAll)<Tab>',         desc = 'Select All',          mode = 'n' },
  { '<leader>mr', '<Plug>(VM-StartRegex-Search)',      desc = 'Start Regex Search',  mode = 'n' },
  { '<leader>mp', '<Plug>(VM-Add-Cursor-At-Pos)',      desc = 'Add Cursor At Pos',   mode = 'n' },
  { '<leader>mo', '<Plug>(VM-Toggle-Mappings)',        desc = 'Toggle Mappings',     mode = 'n' },
}
