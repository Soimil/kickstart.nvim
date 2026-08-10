local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  gh 'akinsho/bufferline.nvim',
  gh 'nvim-tree/nvim-web-devicons',
}

vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
    mode = 'buffers',
    separator_style = 'slant',
    diagnostics = 'nvim_lsp',
    show_close_icon = false,
    show_buffer_close_icons = true,
    offsets = {
      { filetype = 'neo-tree', text = 'Explorer', highlight = 'Directory', separator = true },
    },
  },
}

-- Buffer cycling intentionally has NO mapping here: Neovim 0.11+ ships `[b` / `]b`
-- (and `[B` / `]B` for first/last) as defaults. See `:help ]b`.
--
-- In particular do NOT map `<Tab>`: in most terminals `<Tab>` and `<C-i>` send the
-- same byte, so mapping it kills `<C-i>` — the jumplist "forward" counterpart to
-- `<C-o>`. See `:help jump-motions`.
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<CR>', { desc = '[B]uffer [P]in' })
