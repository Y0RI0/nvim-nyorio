return {
  -- 'jose-elias-alvarez/null-ls.nvim', --deprecated
  'MunifTanjim/prettier.nvim',
  'nvimtools/none-ls.nvim',
  config = function()
    prettier.setup {
      bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        'markdown',
        'json',
      },
      cli_options = {
        -- https://prettier.io/docs/en/cli.html#--config-precedence
        config_precedence = 'prefer-file', -- or "cli-override" or "file-override"
      },
    }
  end,

  -- plenary
  -- lspconfig
}
