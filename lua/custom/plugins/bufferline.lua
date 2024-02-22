return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function ()
    vim.opt.termguicolors = true
    require("bufferline").setup {
      options = {
        mode = "buffers",
        -- style_preset = require("bufferline"),
        separator_style = "slant",
        diagnostics = "coc",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          }
        }
      }
    }

    vim.keymap.set("n", "<tab>", ":bnext<CR>")
    vim.keymap.set("n", "<S-tab>", ":bprevious<CR>")
  end
}
