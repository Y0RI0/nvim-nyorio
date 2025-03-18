vim.o.exrc = true --  Enables local config search for .nvimrc
local options = {
  -- See `:help
  -- For more options, you can see `:help option-list`
  -- vim.builtin.nvimtree.active = false -- NOTE: using neo-tree   -- disable built in tree view
  laststatus = 0, -- disable regular statusline completely
  hlsearch = true, -- highlight on search
  termguicolors = true,
  number = true, -- Make line numbers default
  mouse = 'a', -- Enable mouse mode, can be useful for resizing splits for example!
  showmode = false, -- Don't show the mode, since it's already in the status line
  clipboard = 'unnamedplus', -- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
  breakindent = true, -- Enable break indent
  cursorline = true, -- cursorline and column to show placement of cursor
  cursorcolumn = true,
  undofile = true, -- Save undo history
  ignorecase = true, -- Case-insensitive searching
  smartcase = true, -- UNLESS \C or one or more capital letters in the search term
  signcolumn = 'yes', -- Keep signcolumn on by default
  updatetime = 250, -- Decrease update time
  timeoutlen = 150, -- Decrease mapped sequence wait time (Displays which-key popup sooner, which adds a little lag to keybinds)
  splitright = true, -- Configure how new splits should be opened
  splitbelow = true, -- Configure how new splits should be opened
  list = true, --  See `:help 'list'`
  listchars = { tab = '» ', trail = '', nbsp = '␣' }, -- whitespace char display, see :help 'listchars
  inccommand = 'split', -- Preview substitutions live, as you type!
  scrolloff = 10, -- Minimal number of screen lines to keep above and below the cursor.
  swapfile = false, -- Disable swapfiles because laggy asf and causing problems
  conceallevel = 1, -- This one helps to properly render markdown checkboxes and such
  foldcolumn = '1', -- NOTE: These are toggled with 'z' something. V select, then z-f to fold the selection
  tabstop = 2, -- Tabs
  softtabstop = 2, -- Tabs
  shiftwidth = 2, -- Tabs
  expandtab = true, -- Tabs
  -- vim: ts=2 sts=2 sw=2 et
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Straight from docs this one https://neovim.io/doc/user/diagnostic.html
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '💡',
    },
    linehl = { -- Highlight entire line for errors
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = { -- Highlight the line number for warnings
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
}
