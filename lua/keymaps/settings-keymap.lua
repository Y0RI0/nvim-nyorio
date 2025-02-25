vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear search on pressing <Esc> in normal mode
-- Relative line throngler
vim.keymap.set('n', '<C-L><C-L>', '<cmd>set invrelativenumber<CR>', { desc = 'Throngle relative lines on and off' })
-- Change ConcealLevel to 0
vim.keymap.set('n', 'C-0', '<cmd>set conceallevel=0<CR>', { desc = 'Toggle conceallevel to 0' })

vim.keymap.set('n', '<leader>hl0', function()
  vim.cmd 'set conceallevel=0'
  require 'notify'('Conceallevel set to 0', '', { title = 'conceallevel 🙈', timeout = 10 })
end, { silent = true, noremap = true, desc = '[h]ide [l]evel (conceallevel) [0]' })

vim.keymap.set('n', '<leader>hl1', function()
  vim.cmd 'set conceallevel=1'
  require 'notify'('Conceallevel set to 1', '', { title = 'conceallevel 🙈', timeout = 10 })
end, { silent = true, noremap = true, desc = '[h]ide [l]evel (conceallevel) [1]' })
