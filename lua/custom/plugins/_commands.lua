-- Krótkie skróty na vim.pack (odpowiednik :Lazy)

-- :Pack  -> okno z listą zainstalowanych pluginów (offline, bez sieci)
vim.api.nvim_create_user_command('Pack',
  function() vim.pack.update(nil, { offline = true }) end,
  { desc = 'Lista pluginów (offline)' }
)

-- :PackUp           -> aktualizacja wszystkich
-- :PackUp foo bar   -> aktualizacja wybranych po nazwie
vim.api.nvim_create_user_command('PackUp', function(opts)
  if #opts.fargs == 0 then
    vim.pack.update()
  else
    vim.pack.update(opts.fargs)
  end
end, {
  desc = 'Update pluginów (wszystkich albo podanych)',
  nargs = '*',
  complete = function()
    local names = {}
    for _, p in ipairs(vim.pack.get()) do table.insert(names, p.spec.name) end
    return names
  end,
})
