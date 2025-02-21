-- Obsidian Keymaps
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = '[O]bsidian [n]ew' })
vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = '[O]bsidian [b]acklinks' })
vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTags<CR>', { desc = '[O]bsidian [T]ags' })
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = '[O]bsidian [S]earch' })
vim.keymap.set('n', '<leader>so', '<cmd>ObsidianSearch<CR>', { desc = '[S]earch [O]bsidian' })

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
