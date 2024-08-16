-- Stolen and modified from https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html
-- Automatically terraform fmt and align on save
vim.cmd [[let g:terraform_fmt_on_save=1]]
vim.cmd [[let g:terraform_align=1]]

-- Require terraform language and tflint in lspconfig
local lspconfig = require 'lspconfig'
lspconfig.terraformls.setup {
  cmd = { '/home/linuxbrew/.linuxbrew/bin/terraform-ls', 'serve' },
  filetypes = { 'terraform', 'hcl' },
  root_dir = lspconfig.util.root_pattern('.terraform', '.git'),
}

-- I think this specifically was causing my crashing on saves
-- Come to think of it... I have no idea what benefit this actually
-- would've given me if it were working
--[[ lspconfig.tflint.setup {
  cmd = { '/home/linuxbrew/.linuxbrew/bin/tflint', '--langserver' },
  filetypes = { 'terraform', 'hcl' },
  root_dir = lspconfig.util.root_pattern('.terraform', '.git'),
} ]]

-- SOMETHING IS WRONG EITHER RIGHT HERE
-- vim.cmd [[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]]
-- Disabled because it was causing a bunch of messed up error highlighting for terragrunt
-- due to the fact that terragrunt has blocks terraform does not support
-- vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=terraform]]
-- vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
-- vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
-- vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]

-- Run this to get treesitter HCL grammar if it is not yet installed for some reason
-- :TSInstall hcl
-- brew install hashicorp/tap/terraform-ls
-- brew install tflint
