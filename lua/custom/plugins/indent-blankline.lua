return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {},
  config = function()
    require('ibl').setup {
      whitespace = {
        remove_blankline_trail = false,
      },
      scope = {
        enabled = false,
      },
    }

    vim.opt.list = true
    vim.opt.listchars:append 'eol:↴'
  end,
}
