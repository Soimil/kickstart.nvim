local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  { src = gh 'nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-tree/nvim-web-devicons',
  gh 'MunifTanjim/nui.nvim',
}

require('neo-tree').setup {
  close_if_last_window = true,
  filesystem = {
    follow_current_file = { enabled = true, leave_dirs_open = false },
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
      hide_by_name = { '.idea', '.git', '.DS_Store' },
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
  window = {
    width = 35,
  },
}

vim.keymap.set('n', '\\',         '<cmd>Neotree reveal<cr>',  { desc = 'NeoTree reveal', silent = true })
vim.keymap.set('n', '<leader>e',  '<cmd>Neotree toggle<cr>',  { desc = 'Toggl[E] file explorer' })
