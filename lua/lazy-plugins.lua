-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  -- custom plugins
  require 'custom/plugins/colorscheme',
  require 'custom/plugins/neo-tree',
  require 'custom/plugins/comment',
  require 'custom/plugins/vis-multiline',
  require 'custom/plugins/obsidian',
  require 'custom/plugins/render-markdown',
  require 'custom/plugins/image',
  require 'custom/plugins/harpoon',
  require 'custom/plugins/alpha',
  require 'custom/plugins/undotree',
  require 'custom/plugins/trouble',
  require 'custom/plugins/notify',
  require 'custom/plugins/telescope',
  require 'custom/plugins/highlight-colors',
  require 'custom/plugins/gitsigns', -- customized
  require 'custom/plugins/which-key', -- customized
  require 'custom/plugins/lspconfig', -- customized
  require 'custom/plugins/leap',
  require 'custom/plugins/easypick',
  require 'custom/plugins/todo-comments', -- !I: Customized
  require 'custom/plugins/lualine',

  -- oldge vim plugin for syntax
  require 'config/moonscript',

  -- kickstart, pre-included plugins

  require 'kickstart/plugins/conform',
  require 'kickstart/plugins/cmp',
  require 'kickstart/plugins/mini',
  require 'kickstart/plugins/treesitter',

  require 'kickstart.plugins.debug', -- I should learn how to use this
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint', -- custom, turned on some default linters
  require 'kickstart.plugins.autopairs',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
