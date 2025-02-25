local keymaps = {
  {
    mode = 'n',
    key = '<leader>si',
    func = function()
      vim.cmd 'Easypick nerdfonticons'
    end,
    args = { silent = true, noremap = true, desc = '[S]earch nerdfont [i]cons' },
  },
  {
    mode = 'n',
    key = '<leader>sc',
    func = function()
      vim.cmd 'Easypick callouts'
    end,
    args = { silent = true, noremap = true, desc = '[S]earch [c]allouts' },
  },
}

for _, keymap in ipairs(keymaps) do
  vim.keymap.set(keymap.mode, keymap.key, keymap.func, keymap.args)
end
