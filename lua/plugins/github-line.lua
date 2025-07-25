return {
  'mrexox/github-open.nvim',
  keys = {
    {
      '<leader>ghf',
      function()
        require('github-open').open_file()
      end,
    },
    {
      '<leader>ghl',
      function()
        require('github-open').open_line()
      end,
    },
    {
      '<leader>ghb',
      function()
        require('github-open').open_blame_line()
      end,
    },
    {
      '<leader>ghc',
      function()
        require('github-open').open_commit()
      end,
    },
  },
}
