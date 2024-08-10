-- plugins.lua or your lazy.nvim configuration file
return {
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require 'lint'

      -- Set up linters for different file types
      lint.linters.markdownlint = {
        cmd = 'markdownlint',
        stdin = true,
        args = { '--fix' },
        stream = 'stdout',
        ignore_exitcode = true,
      }

      -- Function to lint Markdown files
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
      }

      -- Optional: Auto-lint on BufWritePost
      vim.api.nvim_create_autocmd('BufWritePost', {
        pattern = '*.md',
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Ensure markdownlint is installed globally or adjust the command path accordingly
  -- 'mivalt/markdownlint-cli' for installing markdownlint via npm
}
