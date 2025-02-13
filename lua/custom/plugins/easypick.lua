return {
  {
    'axkirillov/easypick.nvim',
    lazy = false,
    config = function()
      require('easypick').setup {
        pickers = {
          {
            name = 'colorscheme',
            command = 'cat ' .. list,
            action = easypick.actions.nvim_command 'colorscheme',
            opts = require('telescope.themes').get_cursor {},
            vim.api.nvim_put(
              { firstChar },
              'c', -- character-wise
              true, -- move-cursor
              true -- block-mode
            ),
          },
        },
      }
    end,
  },
}
