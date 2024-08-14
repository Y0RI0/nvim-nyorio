return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    --    'folke/tokyonight.nvim',

    -- Spaceduck
    'pineapplegiant/spaceduck',
    branch = 'dev',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'spaceduck'
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  { 'calind/selenized.nvim' },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- Main options --
        -- NOTE: to use the light theme, set `vim.o.background = 'light'`
        style = 'vulgaris', -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
        toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
        toggle_style_list = { 'vulgaris', 'multiplex', 'light' }, -- List of styles to toggle between
        transparent = true, -- Show/hide background
        dim_inactive = false, -- Dim inactive windows/buffers
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- Change code style ---
        -- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
        -- You can also configure styles with a string, e.g. keywords = 'italic,bold'
        code_style = {
          comments = { italic = true },
          conditionals = { italic = true },
          keywords = {},
          functions = {},
          namespaces = { italic = true },
          parameters = { italic = true },
          strings = {},
          variables = {},
        },

        -- Lualine options --
        lualine = {
          transparent = false, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
          darker = false, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      }
      require('bamboo').load()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
