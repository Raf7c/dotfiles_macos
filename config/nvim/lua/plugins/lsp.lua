return {
  "williamboman/mason.nvim",
  tag = "v1.10.0",
  dependencies = {
    { "neovim/nvim-lspconfig",             commit = "5c33bf1f708ac8cb839469e1a03d45987fec305c" },
    { "williamboman/mason-lspconfig.nvim", tag = "v1.29.0" },
    { "hrsh7th/nvim-cmp",                  commit = "a110e12d0b58eefcf5b771f533fc2cf3050680ac" },
    { "hrsh7th/cmp-nvim-lsp",              commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d" },
    { "hrsh7th/cmp-buffer",                commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" },
    { "hrsh7th/cmp-path",                  commit = "91ff86cd9c29299a64f968ebb45846c485725f23" },
    { "L3MON4D3/LuaSnip",                  tag = "v2.3.0" },
    { "onsails/lspkind.nvim",              commit = "1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf" },
    { "pmizio/typescript-tools.nvim",      commit = "c43d9580c3ff5999a1eabca849f807ab33787ea7" },
  },
  config = function()

    -- Default server
    local servers_list = {
      "lua_ls",
      "html",
      "cssls",
      "tailwindcss",
      "tsserver",
      "pyright",
      "docker_compose_language_service",
      "dockerls",
      "terraformls",
      "graphql",
      "jsonls",
      "yamlls",
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers_list,
    })

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_config = require("lspconfig")
    local lspkind = require'lspkind'

    -- Completion engine setup
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path"},
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          show_label_details = true,
        }),
      },
    })
    
    -- End completion engine setup

    -- Diagnostic customization
    vim.diagnostic.config({
      float = {
        source = true
      },
    })

    -- Global key mapping
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { desc = "open diagnostic popup" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

    -- Callback executed when a server is attached to a buffer
    local on_attach_callback = function(client, buffer)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = buffer })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = buffer })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = buffer })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = buffer })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = buffer })
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, { desc = "List workspace folders", buffer = buffer })
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = buffer })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = buffer })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Check references", buffer = buffer })
    end

    for _, value in pairs(servers_list) do
      local server = lsp_config[value]
      server.setup({
        capabilities = capabilities,
        on_attach = on_attach_callback,
      })
    end

    -- Language specific extensions

    local tstools = require("typescript-tools")
    tstools.setup({
      on_attach = on_attach_callback
    })
  end,
}