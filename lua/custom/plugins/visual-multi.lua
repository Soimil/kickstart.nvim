return {
  'mg979/vim-visual-multi',
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ['Find Under'] = '',
    }
    vim.g.VM_add_cursor_at_pos_no_mappiong = 1
  end,
  config = function()
    local function visual_cursors_with_delay()
      vim.cmd 'silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"'
      vim.cmd 'sleep 200m'
      vim.cmd 'silent! execute "normal! A"'
    end

    require('which-key').add {
      { '<leader>m', group = 'Visual Multi' },
      { '<leader>ma', '<PLug>(VM-SelectAll)<Tab>', desc = 'Select All', mode = 'n' },
      { '<leader>mr', '<Plug>(VM-StartRegex-Search)', desc = 'Start Regex Search', mode = 'n' },
      { '<leader>mp', '<Plug>(VM-Add-Cursor-At-Pos)', derc = 'Add Cursor At Pos', mpde = 'n' },
      { '<leader>mv', visual_cursors_with_delay, desc = 'Visual Cursors', mode = 'v' },
      { '<leader>mo', '<Plug>(VM-Toggle-Mappings)', desc = 'Toggle Mappings', mode = 'n' },
    }
  end,
}
