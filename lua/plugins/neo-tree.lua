-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal position=float<CR>', { desc = 'NeoTree reveal' } },
    { '<leader>\\', ':Neotree git_status position=float<CR>', { desc = 'NeoTree show git status' } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['P'] = {
            'toggle_preview',
            config = {
              use_float = true,
              use_image_nvim = true,
              title = 'Wut dis? 👀',
            },
          },
        },
      },
      -- This is custom
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
      -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#harpoon-index
      components = {
        harpoon_index = function(config, node, _)
          local harpoon_list = require('harpoon'):list()
          local path = node:get_id()
          local harpoon_key = vim.uv.cwd()

          for i, item in ipairs(harpoon_list.items) do
            local value = item.value
            if string.sub(item.value, 1, 1) ~= '/' then
              value = harpoon_key .. '/' .. item.value
            end

            if value == path then
              vim.print(path)
              return {
                text = string.format(' ⥤ %d', i), -- <-- Add your favorite harpoon like arrow here
                highlight = config.highlight or 'NeoTreeDirectoryIcon',
              }
            end
          end
          return {}
        end,
      },
      renderers = {
        file = {
          { 'icon' },
          { 'name', use_git_status_colors = true },
          { 'harpoon_index' }, --> This is what actually adds the component in where you want it
          { 'diagnostics' },
          { 'git_status', highlight = 'NeoTreeDimText' },
        },
      },
    },
  },
}
