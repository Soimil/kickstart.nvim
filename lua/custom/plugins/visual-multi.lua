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

    require('which-key').register({
      m = {
        name = 'Visual Multi',
        a = { '<Plug>(VM-SelectAll)<Tab>', 'Select All', mode = { 'n' } },
        r = { '<Plug>(VM-StartRegex-Search)', 'Start Regex Search', mode = { 'n' } },
        p = { '<Plug>(VM-Add-Cursor-At-Pos)', 'Add Cursor At Pos', mpde = { 'n' } },
        v = { visual_cursors_with_delay, 'Visual Cursors', mode = { 'v' } },
        o = { '<Plug>(VM-Toggle-Mappings)', 'Toggle Mappings', mode = { 'n' } },
      },
    }, { prefix = '<leader>' })
  end,
}
