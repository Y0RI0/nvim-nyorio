-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- this thing just makes obsidian.nvim stop hiding markdown backticks so I can
-- actually see what's going on
-- stole this from
-- https://github.com/epwalsh/obsidian.nvim/issues/492#issuecomment-2195212283
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.cmd [[
      augroup MarkdownSyntaxMatch
        autocmd!
        autocmd FileType markdown syntax match @conceal /```/ conceal cchar=⋯
      augroup END
    ]]
  end,
})
