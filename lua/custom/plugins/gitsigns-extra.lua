-- Dodatki do gitsigns ponad to, co konfiguruje baza kickstarta w `init.lua`.
--
-- ZASADA: kickstart jest nadrzedny. Ten plik tylko DOKLADA. Nie ma tu `signs`,
-- nie ma `on_attach` i nie ma zadnego z keymapow `<leader>h*`, `]c`, `[c`, `ih`
-- ani `<leader>tb` / `<leader>tw` - wszystkie te rzeczy ustawia juz `init.lua`
-- i to jego wersja obowiazuje.
--
-- Wazne, gdyby ktos chcial tu dopisac `on_attach`: drugie wywolanie `setup()`
-- NADPISALOBY `on_attach` z `init.lua` w calosci (to pojedyncze pole, nie lista),
-- czyli po cichu skasowalo cala baze keymapow gitsigns. Dlatego dodatkowe mapowania
-- idza przez zwykle `vim.keymap.set` ponizej, a nie przez `on_attach`.

-- gitsigns jest instalowany przez `init.lua`; tutaj tylko rozszerzamy konfiguracje.
-- `setup()` scala podane klucze z zywa konfiguracja zamiast ja resetowac, wiec
-- pominiete klucze (`signs`, `on_attach`) zostaja takie, jak ustawil je kickstart.
require('gitsigns').setup {
  -- Blame biezacej linii na koncu linii, jak w VSCode. Kickstart tego nie wlacza.
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 300,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '   <author>, <author_time:%R> • <summary>',
}

-- Jedyne dodatkowe mapowanie: podglad usunietych linii inline.
-- Kickstart mapuje `<leader>tb` (blame) i `<leader>tw` (word diff), ale nie ma
-- odpowiednika dla `toggle_deleted`, wiec `<leader>tD` niczego nie przykrywa.
--
-- Mapowanie jest globalne, a nie buforowe: ta wersja gitsigns nie emituje zdarzenia
-- `User GitSignsAttach`, wiec jedyna droga do mapowania buforowego bylby `on_attach`,
-- czyli nadpisanie bazy kickstarta. Poza repozytorium git wywolanie po prostu nic nie robi.
vim.keymap.set('n', '<leader>tD', function() require('gitsigns').toggle_deleted() end, { desc = '[T]oggle git show [D]eleted lines' })
