-- defaults
-- vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
-- vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
-- vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')

-- birectional normal visual
-- vim.keymap.set({'n', 'x'}, 's', '<Plug>(leap)')
-- vim.keymap.set('n',        'S', '<Plug>(leap-from-window)')
-- vim.keymap.set('o',        's', '<Plug>(leap-forward)')
-- vim.keymap.set('o',        'S', '<Plug>(leap-backward)')

-- anywhere one key
vim.keymap.set('n', 's', '<Plug>(leap-anywhere)')
vim.keymap.set('x', 's', '<Plug>(leap)')
vim.keymap.set('o', 's', '<Plug>(leap-forward)')
vim.keymap.set('o', 'S', '<Plug>(leap-backward)')
