return {
  'Wansmer/treesj',
  keys = { '<space>m', '<space>j', '<space>s' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup {
      max_joun_length = 120,
      cursor_behavior = 'hold',
      notify = true,
      langs = {
        lua = require 'treesj.langs.lua',
        php = require 'treesj.langs.php',
        typescript = require 'treesj.langs.typescript',
        html = require 'treesj.langs.html',
        css = require 'treesj.langs.css',
      },
      dot_repeat = true,
    }
  end,
}
