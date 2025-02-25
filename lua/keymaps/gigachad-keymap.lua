-- Gigachad mode enabled
-- Basically prevent navigation with arrow keys
-- local keymaps = {
--   { mode = 'n', key = '<left>', command = '<cmd>echo "Use h to move!!"<CR>' },
--   { mode = 'n', key = '<right>', command = '<cmd>echo "Use l to move!!"<CR>' },
--   { mode = 'n', key = '<up>', command = '<cmd>echo "Use k to move!!"<CR>' },
--   { mode = 'n', key = '<down>', command = '<cmd>echo "Use j to move!!"<CR>' },
-- }
--
-- for _, keymap in ipairs(keymaps) do
--   vim.keymap.set(keymap.mode, keymap.key, keymap.command)
-- end

local keymaps = {
  { 'n', '<left>', '<cmd>echo "Use h to move!!"<CR>' },
  { 'n', '<right>', '<cmd>echo "Use l to move!!"<CR>' },
  { 'n', '<up>', '<cmd>echo "Use k to move!!"<CR>' },
  { 'n', '<down>', '<cmd>echo "Use j to move!!"<CR>' },
}

for _, keymap in ipairs(keymaps) do
  vim.keymap.set(keymap[1], keymap[2], keymap[3])
end
