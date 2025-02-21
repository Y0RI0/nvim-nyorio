-- startup functions would go in here if there were any

-- It is absolute psychopath nonsense that this isn't just the default behavior
-- Why in god's name would I want Delete to store the current line in my buffer?
-- As if I'm somehow unaware of what I'm about to delete
local function normal_ass_dd()
  return '"_dd'
end
vim.keymap.set('n', 'dd', normal_ass_dd, { noremap = true, expr = true, desc = '[dd]elete shit like a normal person' })

-- This function originally would be for unbuffered empty line deletion
-- but I simply wanted it to be able to do visual deletions without buffering them
-- this and the above function essentially fix my issues with non-blackhole deletions
-- in neovim, left in the parts I edited, in case maybe I need them later for similar logic
local function normal_ass_visual_d()
  local l, _ = unpack(vim.api.nvim_win_get_cursor(0))
  for _ in ipairs(vim.api.nvim_buf_get_lines(0, l - 1, l, true)) do
    -- for _, line in ipairs(vim.api.nvim_buf_get_lines(0, l - 1, l, true)) do
    -- if line:match '^%s*$' then
    return '"_d'
    -- end
  end
  -- return 'd'
end
vim.keymap.set('v', 'd', normal_ass_visual_d, { noremap = true, expr = true, desc = '[v]isually [d]elete shit like a normal person' })

-- This is to restore the original functionality of cut-on-delete that comes with
-- vim, but mapped to a different keymap
local function cut_delete()
  return 'dd'
end
vim.keymap.set('n', 'cd', cut_delete, { noremap = true, expr = true, desc = '[c]ut [d]elete' })

local function visual_cut_delete()
  local l, _ = unpack(vim.api.nvim_win_get_cursor(0))
  for _ in ipairs(vim.api.nvim_buf_get_lines(0, l - 1, l, true)) do
    return 'd'
  end
end
vim.keymap.set('v', 'cd', visual_cut_delete, { noremap = true, expr = true, desc = '[v]isual [c]ut [d]elete' })

local function put_first_word(selection)
  for k, v in pairs(selection) do
    print(k, v)
  end
  local firstWord = string.match(selection.args, '[^%s]+')
  print(firstWord)
  vim.api.nvim_put(
    { firstWord },
    'c', -- character-wise
    true, -- move-cursor
    true -- block-mode
  )
end
vim.api.nvim_create_user_command('PutFirstWord', put_first_word, { nargs = 1, desc = '' })

local function put_line(selection)
  vim.api.nvim_put(
    { selection.args },
    'c', -- character-wise
    true, -- move-cursor
    true -- block-mode
  )
end
vim.api.nvim_create_user_command('PutLine', put_line, { nargs = 1, desc = '' })
