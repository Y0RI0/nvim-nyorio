-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>dt', function()
  local is_enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not is_enabled)
  -- print(is_enabled and 'Diagnostics disabled' or 'Diagnostics enabled')
  require 'notify'((is_enabled and 'Diagnostics disabled' or 'Diagnostics enabled'), '', { title = 'Diagnostics 💊', timeout = 10 })
end, { silent = true, noremap = true, desc = '[d]iagnostics [t]oggle' })
