return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {}

    vim.keymap.set('i', [[<C-\>]], '<cmd>exe v:count1 . "ToggleTerm"<CR>')
    vim.keymap.set('n', [[<C-\>]], '<cmd>exe v:count1 . "ToggleTerm"<CR>')
  end,
}
