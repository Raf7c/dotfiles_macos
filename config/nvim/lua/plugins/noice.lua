return {
  "folke/noice.nvim",
  version = "v4.2.2",
  event = "VimEnter",

  dependencies = {
    "MunifTanjim/nui.nvim", -- Dépendance pour les composants d'interface utilisateur
    "rcarriga/nvim-notify", -- Dépendance pour les notifications
  },
  confg = function ()
    require("noice").setup {
      cmdline = {
        enabled = false,
      },
      messages = {
        enabled = true,
      },
      popupmenu = {
        enabled = false,
      },
      notify = {
        enabled = true,
      },
    }
  end


}
