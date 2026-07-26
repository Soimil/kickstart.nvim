local gh = require('custom.plugins._helpers').gh

vim.pack.add { gh 'numToStr/Comment.nvim' }
require('Comment').setup()
