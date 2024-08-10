return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 10, -- Default terminal height
      open_mapping = [[<C-\>]], -- Keybinding to toggle terminal
      hide_numbers = true, -- Hide the number column in the terminal buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = 'float', -- Can be 'horizontal', 'vertical', 'tab', or 'float'
      close_on_exit = false,
      shell = vim.o.shell,
      stopOnEntry = false,
      float_opts = {
        border = 'curved',
        winblend = 3,
        height = 34,
        width = 120,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }
  end,
}
