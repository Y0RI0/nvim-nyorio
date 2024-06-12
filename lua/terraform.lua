-- Stolen and modified from https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html

vim.cmd [[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]]
-- Disabled because it was causing a bunch of messed up error highlighting for terragrunt
-- due to the fact that terragrunt has blocks terraform does not support
vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]

-- Automatically terraform fmt and align on save
vim.cmd [[let g:terraform_fmt_on_save=1]]
vim.cmd [[let g:terraform_align=1]]

-- Keymaps for running terragrunt from inside nvim
vim.keymap.set('n', '<leader>tgi', ':!terragrunt init<CR>')
vim.keymap.set('n', '<leader>tgv', ':!terragrunt validate<CR>')
vim.keymap.set('n', '<leader>tgp', ':!terragrunt plan<CR>')
vim.keymap.set('n', '<leader>tga', ':!terragrunt apply -auto-approve<CR>')
vim.keymap.set('n', '<leader>tgf', ':cd %:p:h | !terragrunt hclfmt<CR>')

-- Require terraform language and tflint in lspconfig
local lspconfig = require 'lspconfig'
lspconfig.terraformls.setup {
  cmd = { '/home/linuxbrew/.linuxbrew/bin/terraform-ls', 'serve' },
  filetypes = { 'terraform', 'hcl' },
  root_dir = lspconfig.util.root_pattern('.terraform', '.git'),
}
lspconfig.tflint.setup {
  cmd = { '/home/linuxbrew/.linuxbrew/bin/tflint', '--langserver' },
  filetypes = { 'terraform', 'hcl' },
  root_dir = lspconfig.util.root_pattern('.terraform', '.git'),
}
-- not entirely sure this actually does anything
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*.tf', '*.tfvars', '*.hcl' },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Run this to get treesitter HCL grammar if it is not yet installed for some reason
-- :TSInstall hcl
-- brew install hashicorp/tap/terraform-ls
-- brew install tflint
