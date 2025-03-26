-- !I: See `:help wincmd` for a list of all window commands
local keymaps = {
  -- Window schmoovement
  { 'n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' } },
  { 'n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' } },
  -- !NOTE: I'll need to think about how to do that differently
  -- {'n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' }},
  -- {'n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' }},
  { 'n', '<C-j>', '<C-f>', { desc = 'Page Down' } },
  { 'n', '<C-k>', '<C-b>', { desc = 'Page Up' } },
  -- Split management
  { 'n', '<leader>bv', '<C-w>v', { desc = '[b]reak the window vertically' } },
  { 'n', '<leader>bh', '<C-w>s', { desc = '[b]reak the window horizontally' } },
  { 'n', '<leader>bx', '<cmd>close<CR>', { desc = '[b]reak [x]close' } },
  { 'n', '<C-a>', '<cmd>vertical resize +5<CR>', { desc = 'Move the split left' } },
  { 'n', '<C-f>', '<cmd>vertical resize -5<CR>', { desc = 'Move the split right' } },
  { 'n', '<C-d>', '<cmd>resize -5<CR>', { desc = 'Move the split up' } },
  { 'n', '<C-s>', '<cmd>resize +5<CR>', { desc = 'Move the split down' } },
  -- Tab management
  { 'n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'Open new tab' } },
  { 'n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' } },
  { 'n', '<leader>tf', '<cmd>tabn<CR>', { desc = 'Go forward one tab' } },
  { 'n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go backward one tab' } },
  { 'n', '<leader>tc', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' } },
  -- Schmoove to beginning and ends of lines
  { 'n', '<leader>h', '0', { desc = '[m]ove to the [b]eginning of a line' } },
  { 'v', '<leader>h', '0', { desc = '[m]ove to the [b]eginning of a line' } },
  { 'n', '<leader>l', '$', { desc = '[m]ove to the [e]nd of a line' } },
  { 'v', '<leader>l', '$', { desc = '[m]ove to the [e]nd of a line' } },
}

for _, keymap in ipairs(keymaps) do
  vim.keymap.set(keymap[1], keymap[2], keymap[3], keymap[4])
end
