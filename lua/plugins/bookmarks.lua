return {
  'kdnk/nvim-bookmarks',
  config = function()
    local bm = require 'bookmarks'

    bm.setup {
      persist = {
        enable = true,
        dir = './.bookmarks', -- directory to store json file for backup. Please add `**/.bookmarks/*` to your `.gitignore_global`.
        per_branch = true, -- store backup file for each branch
      },
      sign = {
        text = '🔥',
      },
    }

    vim.keymap.set('n', '<leader>mm', bm.toggle) -- toggle bookmark at current line
    vim.keymap.set('n', '<leader>,', bm.jump_prev) -- jump to the previous bookmark over buffers
    vim.keymap.set('n', '<leader>.', bm.jump_next) -- jump to the next bookmark over buffers
    vim.keymap.set('n', '<leader>mx', bm.reset) -- remove all bookmarks
    vim.keymap.set('n', '<leader>mr', bm.restore) -- restore bookmarks from the json backup file

    local restore_called = false
    -- autocmd to restore bookmarks from the json backup file
    local bookmarkGroup = vim.api.nvim_create_augroup('bookmark_auto_restore', {})
    vim.api.nvim_create_autocmd('BufReadPost', {
      callback = function()
        if not restore_called then
          bm.restore()
          restore_called = true -- only restore on post once, to avoid some potential goofiness
        end
      end,
      group = bookmarkGroup,
    })
  end,
}
