return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function ()
    require("ibl").setup {
      -- show_current_context = true,
      -- show_current_context_start = true,
      -- show_end_of_line = true,
      whitespace = {
        remove_blankline_trail = false
      },
      scope = {
        enabled = false,
      }
    }

    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"
  end,
}

