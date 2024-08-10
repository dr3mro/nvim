-- Move to the previous/next tab
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Close the current tab
vim.api.nvim_set_keymap('n', '<leader>x', ':bdelete<CR>', { noremap = true, silent = true })

-- Move the current tab left/right
vim.api.nvim_set_keymap('n', '<leader><Left>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Right>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })

-- Function to create a new terminal buffer
function Open_terminal_in_buffer()
  vim.cmd 'enew' -- Create a new buffer
  vim.cmd 'term' -- Open terminal in the new buffer
  vim.cmd 'startinsert' -- Start terminal in insert mode
end

-- Key mapping to open the terminal in a new buffer
vim.api.nvim_set_keymap('n', '<Leader>tt', ':lua Open_terminal_in_buffer()<CR>', { noremap = true, silent = true })

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
  config = function()
    require('bufferline').setup {
      options = {
        numbers = 'ordinal', -- Display buffer numbers in the tabline
        close_command = 'bdelete! %d', -- Command to close a buffer
        right_mouse_command = 'bdelete! %d', -- Close buffer on right-click
        offsets = { { filetype = 'NvimTree', text = 'File Explorer', padding = 1 } },
        separator_style = 'slant', -- Options: "slant", "thick", "thin", etc.
        show_buffer_close_icons = true,
        show_close_icon = true,
        tab_size = 20,
      },
    }
  end,
}
