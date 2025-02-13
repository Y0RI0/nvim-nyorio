--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'options' -- nvim settings, vim opts
require 'keymaps' -- keymap require context from subfiles
require 'lazy-bootstrap' -- installs lazy.nvim
require 'lazy-plugins' -- installs lazy plugins
require 'functions' -- startup functions
require 'config' -- non-plugin configs

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
