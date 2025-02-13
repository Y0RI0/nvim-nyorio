return {
  {
    'axkirillov/easypick.nvim',
    lazy = false,
    config = function()
      local easypick = require 'easypick'
      require('easypick').setup {
        pickers = {
          {
            name = 'nerdfonticons 󰇷',
            command = 'cat ~/.deez/nerdfonticons',
            action = easypick.actions.nvim_commandf 'PutFirstWord %s', -- see functios.lua
            opts = require('telescope.themes').get_cursor {},
          },
          {
            name = 'callouts ',
            command = 'cat ~/.deez/mdcallouts',
            action = easypick.actions.nvim_commandf 'PutLine %s', -- see functios.lua
            opts = require('telescope.themes').get_cursor {},
          },
        },
      }
    end,
  },
}
