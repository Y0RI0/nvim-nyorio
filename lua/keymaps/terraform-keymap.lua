-- See config/terraform.lua for lspconfig and such
-- Keymaps for running terragrunt from inside nvim
vim.keymap.set('n', '<leader>tgi', ':!terragrunt init<CR>')
vim.keymap.set('n', '<leader>tgv', ':!terragrunt validate<CR>')
vim.keymap.set('n', '<leader>tgp', ':!terragrunt plan<CR>')
vim.keymap.set('n', '<leader>tga', ':!terragrunt apply -auto-approve<CR>')
vim.keymap.set('n', '<leader>tgf', ':cd %:p:h | !terragrunt hclfmt<CR>')
