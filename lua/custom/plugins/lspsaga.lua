return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    require('lspsaga').setup {
      lightbulb = {
        enable = false,
      },
    }

    require('which-key').add {
      { '<leader>l', group = 'Lspsaga' },
      { '<leader>lc', '<cmd>Lspsaga code_action<cr>', desc = 'Code Action' },
      { '<leader>lo', '<cmd>Lspsaga outline<cr>', desc = 'Outline' },
      { '<leader>lr', '<cmd>Lspsaga rename<cr>', desc = 'Rename' },
      { '<leader>ld', '<cmd>Lspsaga goto_definition<cr>', desc = 'Lsp GoTo Definition' },
      { '<leader>lf', '<cmd>Lspsaga finder<cr>', desc = 'Lsp Finder' },
      { '<leader>lp', '<cmd>Lspsaga preview_definition<cr>', desc = 'Preview Definition' },
      { '<leader>ls', '<cmd>Lspsaga signature_help<cr>', desc = 'Signature Help' },
      { '<leader>lw', '<cmd>Lspsaga show_workspace_diagnostics<cr>', desc = 'Show Workspace Diagnostics' },
    }
  end,
}
