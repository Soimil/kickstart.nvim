return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    --    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },

  config = function()
    require('lspsaga').setup {
      lightbulb = {
        enable = false,
      },
    }

    require('which-key').register({
      l = {
        name = 'Lspsaga',
        c = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
        o = { '<cmd>Lspsaga outline<cr>', 'Outline' },
        r = { '<cmd>Lspsaga rename<cr>', 'Rename' },
        d = { '<cmd>Lspsaga goto_definition<cr>', 'Lsp GoTo Definition' },
        f = { '<cmd>Lspsaga finder<cr>', 'Lsp Finder' },
        p = { '<cmd>Lspsaga preview_definition<cr>', 'Preview Definition' },
        s = { '<cmd>Lspsaga signature_help<cr>', 'Signature Help' },
        w = { '<cmd>Lspsaga show_workspace_diagnostics<cr>', 'Show Workspace Diagnostics' },
      },
    }, { prefix = '<leader>' })
  end,
}
