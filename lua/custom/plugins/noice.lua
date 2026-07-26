local gh = require('custom.plugins._helpers').gh

vim.pack.add {
  gh 'folke/noice.nvim',
  gh 'MunifTanjim/nui.nvim',
  gh 'rcarriga/nvim-notify',
}

require('noice').setup {
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },
}

vim.notify = require('notify')
