return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          layout_strategy = 'flex',
          layout_config = {
            -- height = 0.95,
            -- width = 0.95,
          },
          mappings = {
            i = {
              ['<c-enter>'] = 'to_fuzzy_refine',
            },
            -- n = {},
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>s:', builtin.command_history, { desc = '[S]earch :History' })
      vim.keymap.set('n', '<leader>s,', function()
        builtin.find_files { hidden = true, no_ignore = true, cwd = vim.fn.getcwd() }
      end, { desc = '[S]earch hidden files [,]' })
      vim.keymap.set('n', '<leader>s;', function()
        builtin.live_grep { additional_args = { '--hidden', '--glob', '!.git' } }
      end, { desc = 'Grep within hidden files' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- ################################################################################################ --
      -- [S]earch [D]irectory keymap, because ripgrep doesn't support -type d and fd
      -- is simply not working for me at all when I try to do this
      -- Search <leader>sh , telescope , / , function(_, map)
      vim.keymap.set('n', '<leader>sd', function()
        builtin.find_files {
          prompt_title = 'Choose a directory to send the current file to',
          attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
              local selection = require('telescope.actions.state').get_selected_entry()
              local dir = vim.fn.fnamemodify(selection.path, ':p:h')
              require('telescope.actions').close(prompt_bufnr)
              local file = vim.fn.expand '%:p'
              -- vim.cmd(string.format('silent !mv %s %s', vim.fn.fnameescape(file), vim.fn.fnameescape(dir)))
              vim.system({ 'mv', file, dir }):wait()
              vim.cmd 'Alpha' -- collapse back into alpha, since buffer is gone
              require 'notify'("That's all she yote", 'info', { title = 'Yeet 🏀' })
            end)
            -- true to map default_mappings and
            -- false if not
            return true
          end,
          find_command = { 'bash', '-c', 'fdfind --type d && echo "."' },
          -- The OG Way to do this
          --[[   find_command = {
            'find',
            '-type',
            'd',
          }, ]]
        }
      end, { desc = '[S]earch [D]irectories (In order to yeet the current file there)' })

      -- keymap to grab mdcallouts for insertion
      vim.keymap.set('n', '<leader>sc', function()
        builtin.find_files(require('telescope.themes').get_cursor {
          prompt_title = 'Choose a callout to insert 🗣️ ',
          previewer = false,
          layout_config = {
            height = 0.70,
            width = 0.30,
          },
          find_command = {
            'bash',
            '-c',
            [[
            cat ~/.deez/mdcallouts
            ]],
          },
          attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
              local selection = require('telescope.actions.state').get_selected_entry().path
              require('telescope.actions').close(prompt_bufnr)
              vim.api.nvim_put(
                { selection },
                'c', -- character-wise
                true, -- move-cursor
                true -- block-mode
              )
            end)
            return true -- Map to defaults for picker
          end,
        })
      end, { desc = '[S]earch markdown [C]allouts' })

      -- keymap to grab mdcallouts for insertion
      vim.keymap.set('n', '<leader>si', function()
        builtin.find_files(require('telescope.themes').get_cursor {
          prompt_title = 'Choose a nerd font icon to insert 🤓 ',
          previewer = false,
          layout_config = {
            height = 0.70,
            width = 0.30,
          },
          find_command = {
            'bash',
            '-c',
            [[
            cat ~/.deez/nerdfonticons
            ]],
          },
          attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
              local selection = require('telescope.actions.state').get_selected_entry().path
              local firstChar = string.match(selection, '[^%s]+')
              require('telescope.actions').close(prompt_bufnr)
              vim.api.nvim_put(
                { firstChar },
                'c', -- character-wise
                true, -- move-cursor
                true -- block-mode
              )
            end)
            return true -- Map to defaults for picker
          end,
        })
      end, { desc = '[S]earch nerdfont [i]cons' })

      vim.keymap.set('n', '<leader>sb', function()
        builtin.find_files(require('telescope.themes').get_cursor {
          prompt_title = 'Choose a code snippet to insert ✂️ ',
          cwd = '~/.deez/snips',
          previewer = true,
          layout_config = {
            height = 0.40,
            width = 0.70,
          },
          attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
              local entry = require('telescope.actions.state').get_selected_entry()
              local file = entry.path

              -- Open and read the file
              local f = assert(io.open(file, 'r'))
              local code_snippet = f:read '*all'
              f:close()

              require('telescope.actions').close(prompt_bufnr)

              -- Insert the code snippet
              vim.api.nvim_put(
                vim.split(code_snippet, '\n'),
                'l', -- line-wise
                true, -- move-cursor
                true -- block-mode
              )
              local notification = string.format('Snippet for %s inserted.', file)
              require 'notify'(notification, '', { title = 'snippets ✀ ', timeout = 100 })
            end)

            return true -- Map to defaults for picker
          end,
        })
      end, { desc = 'Choose code [s]nippet to [i]nsert' })

      -- keymap to grab mdcallouts for insertion
      vim.keymap.set('n', '<leader>sp', function()
        builtin.find_files(require('telescope.themes').get_cursor {
          prompt_title = 'Choose a nerd font icon to insert 🤓 ',
          previewer = false,
          layout_config = {
            height = 0.70,
            width = 0.30,
          },
          find_command = {
            'bash',
            '-c',
            [[
            rg | cat ~/.deez/nerdfonticons
            ]],
          },
          attach_mappings = function(_, map)
            map('i', '<CR>', function(prompt_bufnr)
              local selection = require('telescope.actions.state').get_selected_entry().path
              local firstChar = string.match(selection, '[^%s]+')
              require('telescope.actions').close(prompt_bufnr)
              vim.api.nvim_put(
                { firstChar },
                'c', -- character-wise
                true, -- move-cursor
                true -- block-mode
              )
            end)
            return true -- Map to defaults for picker
          end,
        })
      end, { desc = '[S]earch nerdfont [i]cons' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
