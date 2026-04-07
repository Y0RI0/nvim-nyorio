-- Stolen and modified from https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html
-- Automatically terraform fmt and align on save
vim.cmd [[let g:terraform_fmt_on_save=1]]
vim.cmd [[let g:terraform_align=1]]

vim.lsp.config('terraformls', {
  cmd = { '/home/linuxbrew/.linuxbrew/bin/terraform-ls', 'serve' },
  filetypes = { 'terraform', 'hcl' },
  root_markers = { '.terraform', '.git' },
})
vim.lsp.enable 'terraformls'

-- Run this to get treesitter HCL grammar if it is not yet installed for some reason
-- :TSInstall hcl
-- brew install hashicorp/tap/terraform-ls
-- brew install tflint
