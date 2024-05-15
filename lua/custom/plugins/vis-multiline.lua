return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ['Find Under'] = '',
        ['Find Subword Under'] = '',
        -- ['Select All'] = '\\A',
        -- ['Start Regex Search'] = '\\/',
        ['Add Cursor Down'] = '<C-Down>',
        ['Add Cursor Up'] = '<C-Up>',
        ['Add Cursor At Pos'] = 'ml',
        -- ['Visual Regex'] = '\\/',
        -- ['Visual All'] = '\\A',
        -- ['Visual Add'] = '\\a',
        -- ['Visual Find'] = '\\f',
        -- ['Visual Cursors'] = '\\c',
      }
    end,
    config = function()
      -- vim.keymap.set('n', 'f', '<Plug>(VM-Find-Under)')
    end,
  },
}
