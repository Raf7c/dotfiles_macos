return {
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
        { "j-hui/fidget.nvim", config = true },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      opts = {
        servers = {},
        setup = {},
        format = {
          timeout_ms = 3000,
        },
      },
      config = function(plugin, opts)
        require("plugins.lsp.servers").setup(plugin, opts)
      end,
    },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      cmd = "Mason",
      opts = {
        ensure_installed = {
          "shfmt",
        },
      },
      config = function(_, opts)
        require("mason").setup(opts)
        local mr = require "mason-registry"
        local function ensure_installed()
          for _, tool in ipairs(opts.ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
              p:install()
            end
          end
        end
        if mr.refresh then
          mr.refresh(ensure_installed)
        else
          ensure_installed()
        end
      end,
    },
    {
      "utilyre/barbecue.nvim",
      event = "VeryLazy",
      dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
      },
      config = true,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      event = "BufReadPre",
      dependencies = { "mason.nvim" },
      opts = function()
        local nls = require "null-ls"
        return {
          root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
          sources = {
            nls.builtins.formatting.shfmt,
          },
        }
      end,
    },
  }
  