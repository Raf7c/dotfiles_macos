return {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>g", function() end, mode = {"n", "x"}, desc = "+Git" },
      { "<leader>gg", "<CMD>LazyGit<CR>", desc = "Open LazyGit" },
    },
  }