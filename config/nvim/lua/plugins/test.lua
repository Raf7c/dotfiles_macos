return {
    {
        "vim-test/vim-test",
        opts = {
          setup = {},
        },
        config = function(plugin, opts)
          vim.g["test#strategy"] = "neovim"
          vim.g["test#neovim#term_position"] = "belowright"
          vim.g["test#neovim#preserve_screen"] = 1
    
          -- Set up vim-test
          for k, _ in pairs(opts.setup) do
            opts.setup[k](plugin, opts)
          end
        end,
      },
      {
        "nvim-neotest/neotest",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
          "antoinemadec/FixCursorHold.nvim",
          "nvim-neotest/neotest-vim-test",
          "vim-test/vim-test",
          "stevearc/overseer.nvim",
        },
        keys = {
          { "<leader>td", "<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", desc = "Debug File" },
          { "<leader>tL", "<cmd>w|lua require('neotest').run.run_last({strategy = 'dap'})<cr>", desc = "Debug Last" },
          { "<leader>ta", "<cmd>w|lua require('neotest').run.attach()<cr>", desc = "Attach" },
          { "<leader>tf", "<cmd>w|lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
          { "<leader>tF", "<cmd>w|lua require('neotest').run.run(vim.loop.cwd())<cr>", desc = "All Files" },
          { "<leader>tl", "<cmd>w|lua require('neotest').run.run_last()<cr>", desc = "Last" },
          { "<leader>tn", "<cmd>w|lua require('neotest').run.run()<cr>", desc = "Nearest" },
          { "<leader>tN", "<cmd>w|lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Nearest" },
          { "<leader>to", "<cmd>w|lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
          { "<leader>ts", "<cmd>w|lua require('neotest').run.stop()<cr>", desc = "Stop" },
          { "<leader>tS", "<cmd>w|lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
        },
        opts = function()
          return {
            adapters = {
              require "neotest-vim-test" {
                ignore_file_types = { "python", "vim", "lua" },
              },
            },
            status = { virtual_text = true },
            output = { open_on_run = true },
            -- overseer.nvim
            consumers = {
              overseer = require "neotest.consumers.overseer",
            },
            overseer = {
              enabled = true,
              force_default = true,
            },
          }
        end,
        config = function(_, opts)
          local neotest_ns = vim.api.nvim_create_namespace "neotest"
          vim.diagnostic.config({
            virtual_text = {
              format = function(diagnostic)
                local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                return message
              end,
            },
          }, neotest_ns)
          require("neotest").setup(opts)
        end,
      },
      {
        "stevearc/overseer.nvim",
        keys = {
          { "<leader>ttR", "<cmd>OverseerRunCmd<cr>", desc = "Run Command" },
          { "<leader>tta", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
          { "<leader>ttb", "<cmd>OverseerBuild<cr>", desc = "Build" },
          { "<leader>ttc", "<cmd>OverseerClose<cr>", desc = "Close" },
          { "<leader>ttd", "<cmd>OverseerDeleteBundle<cr>", desc = "Delete Bundle" },
          { "<leader>ttl", "<cmd>OverseerLoadBundle<cr>", desc = "Load Bundle" },
          { "<leader>tto", "<cmd>OverseerOpen<cr>", desc = "Open" },
          { "<leader>ttq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
          { "<leader>ttr", "<cmd>OverseerRun<cr>", desc = "Run" },
          { "<leader>tts", "<cmd>OverseerSaveBundle<cr>", desc = "Save Bundle" },
          { "<leader>ttt", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
        },
        opts = {},
      },
      {
        "anuvyklack/hydra.nvim",
        opts = {
          specs = {
            test = function()
              local cmd = require("hydra.keymap-util").cmd
              local hint = [[
    ^
    _f_: File
    _F_: All Files
    _l_: Last
    _n_: Nearest
    ^
    _d_: Debug File
    _L_: Debug Last
    _N_: Debug Nearest
    ^
    _o_: Output
    _S_: Summary
    ^
    _a_: Attach
    _s_: Stop
    ^
    ^ ^  _q_: Quit 
              ]]
              return {
                name = "Test",
                hint = hint,
                config = {
                  color = "pink",
                  invoke_on_body = true,
                  hint = {
                    border = "rounded",
                    position = "top-left",
                  },
                },
                mode = "n",
                body = "<A-t>",
                heads = {
                  { "F", cmd "w|lua require('neotest').run.run(vim.loop.cwd())", desc = "All Files" },
                  { "L", cmd "w|lua require('neotest').run.run_last({strategy = 'dap'})", desc = "Debug Last" },
                  { "N", cmd "w|lua require('neotest').run.run({strategy = 'dap'})", desc = "Debug Nearest" },
                  { "S", cmd "w|lua require('neotest').summary.toggle()", desc = "Summary" },
                  { "a", cmd "w|lua require('neotest').run.attach()", desc = "Attach" },
                  { "d", cmd "w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'}", desc = "Debug File" },
                  { "f", cmd "w|lua require('neotest').run.run(vim.fn.expand('%'))", desc = "File" },
                  { "l", cmd "w|lua require('neotest').run.run_last()", desc = "Last" },
                  { "n", cmd "w|lua require('neotest').run.run()", desc = "Nearest" },
                  { "o", cmd "w|lua require('neotest').output.open({ enter = true })", desc = "Output" },
                  { "s", cmd "w|lua require('neotest').run.stop()", desc = "Stop" },
                  { "q", nil, { exit = true, nowait = true, desc = "Exit" } },
                },
              }
            end,
          },
        },
      },
}
