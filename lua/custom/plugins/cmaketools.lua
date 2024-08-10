-- Key mappings for CMake commands
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Key mappings for CMake commands
map('n', '<Leader>mg', ':CMakeGenerate<CR>', opts) -- Generate project files
map('n', '<Leader>mb', ':CMakeBuild<CR>', opts) -- Build the project
map('n', '<Leader>mr', ':CMakeRun<CR>', opts) -- Run the project
map('n', '<Leader>md', ':CMakeDebug<CR>', opts) -- Debug the project
map('n', '<Leader>ms', ':CMakeStopRunner<CR>', opts) -- Stop the project

-- Configuration for lazy.nvim
return {
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require('cmake-tools').setup {
        cmake_command = 'cmake', -- Path to cmake command
        ctest_command = 'ctest', -- Path to ctest command
        cmake_use_preset = true,
        cmake_regenerate_on_save = true, -- Regenerate on save CMakeLists.txt
        cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' }, -- Options for CMakeGenerate
        cmake_build_options = { '-G', 'Ninja' }, -- Options for CMakeBuild
        cmake_build_directory = function()
          if vim.fn.has 'win32' == 1 then
            return 'build\\${variant:buildType}'
          end
          return 'build/${variant:buildType}'
        end, -- Build directory with macro expansion
        cmake_soft_link_compile_commands = true, -- Soft link to compile commands file
        cmake_compile_commands_from_lsp = false, -- Use LSP for compile commands file location
        cmake_kits_path = nil, -- Global cmake kits path
        cmake_variants_message = {
          short = { show = true }, -- Show short message
          long = { show = true, max_length = 40 }, -- Show long message
        },
        cmake_dap_configuration = { -- Debug settings for cmake
          name = 'cpp',
          type = 'codelldb',
          request = 'launch',
          stopOnEntry = false,
          runInTerminal = true,
          console = 'integratedTerminal',
        },
        cmake_executor = { -- Executor configuration
          name = 'toggleterm',
          opts = {
            direction = 'float',
            close_on_exit = false, -- Do not close the terminal automatically
            auto_scroll = true,
            singleton = true,
          },
          default_opts = {
            toggleterm = {
              direction = 'float',
              close_on_exit = false,
              auto_scroll = true,
              singleton = true,
            },
            quickfix = {
              show = 'always',
              position = 'belowright',
              size = 10,
              encoding = 'utf-8',
              auto_close_when_success = true,
            },
            overseer = {
              new_task_opts = {
                strategy = {
                  'toggleterm',
                  direction = 'horizontal',
                  auto_scroll = true,
                  quit_on_exit = 'success',
                },
              },
              on_new_task = function(task)
                require('overseer').open { enter = false, direction = 'right' }
              end,
            },
            terminal = {
              name = 'Main Terminal',
              prefix_name = '[CMakeTools]: ',
              split_direction = 'horizontal',
              split_size = 11,
              single_terminal_per_instance = true,
              single_terminal_per_tab = true,
              keep_terminal_static_location = true,
              start_insert = false,
              focus = false,
              do_not_add_newline = false,
            },
          },
        },
        cmake_runner = { -- Runner configuration
          name = 'toggleterm',
          opts = {
            direction = 'float',
            close_on_exit = false,
            auto_scroll = true,
            singleton = true,
          },
          default_opts = {
            toggleterm = {
              direction = 'float',
              close_on_exit = false,
              auto_scroll = true,
              singleton = true,
            },
            quickfix = {
              show = 'always',
              position = 'belowright',
              size = 10,
              encoding = 'utf-8',
              auto_close_when_success = true,
            },
            overseer = {
              new_task_opts = {
                strategy = {
                  'toggleterm',
                  direction = 'horizontal',
                  auto_scroll = true,
                  quit_on_exit = 'success',
                },
              },
              on_new_task = function(task) end,
            },
            terminal = {
              name = 'Main Terminal',
              prefix_name = '[CMakeTools]: ',
              split_direction = 'horizontal',
              split_size = 11,
              single_terminal_per_instance = true,
              single_terminal_per_tab = true,
              keep_terminal_static_location = true,
              start_insert = false,
              focus = false,
              do_not_add_newline = false,
            },
          },
        },
        cmake_notifications = {
          runner = { enabled = true },
          executor = { enabled = true },
          spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }, -- Icons for progress display
          refresh_rate_ms = 100, -- Refresh rate for spinner
        },
        cmake_virtual_text_support = true, -- Virtual text support
      }
    end,
  },
}
