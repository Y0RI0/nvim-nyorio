require('lazy').setup({
  --!I: This is just showcasing different import styles
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} },
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- Untouched, also showing alternate import syntax
  require 'plugins.debug', -- !I: untouched
  require 'plugins.indent_line', -- !I: untouched
  require 'plugins.autopairs', -- !I: untouched

  -- This would import all of them. Maybe one day when I have a perfect config
  -- { import = 'plugins' },
  ------------------------------------------------------
  -- custom plugins
  require 'plugins/colorscheme',
  require 'plugins/neo-tree',
  require 'plugins/comment',
  require 'plugins/vis-multiline',
  require 'plugins/obsidian',
  require 'plugins/render-markdown',
  require 'plugins/image',
  require 'plugins/harpoon',
  require 'plugins/alpha',
  require 'plugins/undotree',
  require 'plugins/trouble',
  require 'plugins/notify',
  require 'plugins/telescope',
  require 'plugins/highlight-colors',
  require 'plugins/leap',
  require 'plugins/easypick',
  require 'plugins/todo-comments',
  require 'plugins/lualine',
  -- require 'plugins/marks',
  require 'plugins/bookmarks',
  ------------------------------------------------------
  -- Came with Kickstart
  require 'plugins/conform',
  require 'plugins/cmp',
  require 'plugins/mini',
  require 'plugins/treesitter',
  require 'plugins.lint',
  require 'plugins/gitsigns',
  require 'plugins/which-key',
  require 'plugins/lspconfig',
}, {
  ui = {
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

-- Not lazy, just normal include
-- These are either legacy Vim or just reusing something from preloaded plug
require 'plugins/terraform'
require 'plugins/moonscript'

-- vim: ts=2 sts=2 sw=2 et
