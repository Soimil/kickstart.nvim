return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  require('which-key').add {
    { '<leader>L', group = 'flash' },
    {
      '<leader>Ls',
      function()
        require('flash').jump()
      end,
      desc = 'Flash Jump',
    },
    {
      '<leader>Lt',
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      '<leader>Lr',
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Flash Treesitter Search',
    },
  },
}
