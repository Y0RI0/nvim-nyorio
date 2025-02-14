vim.keymap.set('n', '<leader>si', function()
  vim.cmd 'Easypick nerdfonticons'
end, { silent = true, noremap = true, desc = '[S]earch nerdfont [i]cons' })

vim.keymap.set('n', '<leader>sc', function()
  vim.cmd 'Easypick callouts'
end, { silent = true, noremap = true, desc = '[S]earch [c]allouts' })
