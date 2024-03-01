return {
  "mbbill/undotree",
  config = function ()
    vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
    vim.o.undofile = true
    vim.g.undotree_WindowLayout = 3
  end
}
