local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Add items and enter telescope menu
vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
  require 'notify'('File added to menu', '', { title = 'Harpoon 🔱' })
end, { desc = '[a] an item to the harpoon list' })
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = '[e]nter the harpoon telescope menu' })

-- Schmoove through items 1-4
vim.keymap.set('n', 'gh', function()
  harpoon:list():select(1)
end, { desc = '[g]o to [h]arpoon item 1' })
vim.keymap.set('n', 'gj', function()
  harpoon:list():select(2)
end, { desc = '[g]o to [h]arpoon item 2' })
vim.keymap.set('n', 'gk', function()
  harpoon:list():select(3)
end, { desc = '[g]o to [h]arpoon item 3' })
vim.keymap.set('n', 'gl', function()
  harpoon:list():select(4)
end, { desc = '[g]o to [h]arpoon item 4' })

-- Toggle previous & next buffers stored within Harpoon list
-- NOTE: I don't know what to do with these hotkeys yet. Honestly, I don't think I need them for my setup

--[[ vim.keymap.set('n', '<C-S-P>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
  harpoon:list():next()
end) ]]
