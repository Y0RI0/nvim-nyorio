return {
  {
    'axkirillov/easypick.nvim',
    lazy = false,
    config = function()
      local easypick = require 'easypick'
      require('easypick').setup {
        pickers = {
          {
            name = 'nerdfonticons',
            command = 'cat ~/.deez/nerdfonticons',
            action = easypick.actions.nvim_commandf 'PutFirstWord %s', -- see functios.lua
            opts = require('telescope.themes').get_cursor {
              prompt_title = 'Insert Nerd Font Icon 😎',
              layout_config = {
                height = 0.5,
                width = 0.3,
              },
            },
          },
          {
            name = 'callouts',
            command = 'cat ~/.deez/mdcallouts',
            action = easypick.actions.nvim_commandf 'PutLine %s', -- see functios.lua
            opts = require('telescope.themes').get_cursor {
              prompt_title = 'Insert Callout 🗣️🔥 🔥 🔥 🔥 ',
              layout_config = {
                height = 0.5,
                width = 0.3,
              },
            },
          },
        },
      }
    end,
  },
}
