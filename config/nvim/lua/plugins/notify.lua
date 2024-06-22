return {
  "rcarriga/nvim-notify",
  version = "v3.13.5",
  event = "VimEnter",
  config = function()
    -- Configuration de base pour nvim-notify
    require("notify").setup({
      stages = "fade_in_slide_out", -- Animation pour l'apparition et la disparition des notifications
      timeout = 3000, -- Durée d'affichage des notifications (en millisecondes)
      background_colour = "#000000", -- Couleur de fond des notifications
      icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = " ",
        TRACE = "✎ ",
      },
    })

    -- Remplacer la fonction de notification par défaut de Neovim par nvim-notify
    vim.notify = require("notify")
  end,
}

