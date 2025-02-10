-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- Window schmoovement
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- !NOTE: I'll need to think about how to do that differently
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-j>', '<C-f>', { desc = 'Page Down' })
vim.keymap.set('n', '<C-k>', '<C-b>', { desc = 'Page Up' })
-- Split management
vim.keymap.set('n', '<leader>bv', '<C-w>v', { desc = '[b]reak the window vertically' })
vim.keymap.set('n', '<leader>bh', '<C-w>s', { desc = '[b]reak the window horizontally' })
vim.keymap.set('n', '<leader>bx', '<cmd>close<CR>', { desc = '[b]reak [x]close' })
vim.keymap.set('n', '<C-a>', '<cmd>vertical resize +5<CR>', { desc = 'Move the split left' })
vim.keymap.set('n', '<C-f>', '<cmd>vertical resize -5<CR>', { desc = 'Move the split right' })
vim.keymap.set('n', '<C-d>', '<cmd>resize -5<CR>', { desc = 'Move the split up' })
vim.keymap.set('n', '<C-s>', '<cmd>resize +5<CR>', { desc = 'Move the split down' })
-- Tab management
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tf', '<cmd>tabn<CR>', { desc = 'Go forward one tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go backward one tab' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })
-- Schmoove to beginning and ends of lines
vim.keymap.set('n', 'mb', '0', { desc = '[m]ove to the [b]eginning of a line' })
vim.keymap.set('n', 'me', '$', { desc = '[m]ove to the [e]nd of a line' })
