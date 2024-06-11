local keys = {}
function keys.init()
  local keymap = vim.keymap

  --no arrow key allowed
  keymap.set("n", "<up>", "<nop>", { silent = true })
  keymap.set("n", "<down>", "<nop>", { silent = true })
  keymap.set("n", "<left>", "<nop>", { silent = true })
  keymap.set("n", "<right>", "<nop>", { silent = true })

  --Window management
  keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", silent = true })
  keymap.set("n", "<leader>wy", "<C-W>s", { desc = "Split window below", silent = true })
  keymap.set("n", "<leader>wx", "<C-W>v", { desc = "Split window right", silent = true })

  -- Tab
  keymap.set("n", "<leader>tt", "<CMD>tabnew<CR>", { desc = "New Tab", silent = true })
  keymap.set("n", "<leader>td", "<CMD>tabclose<CR>", { desc = "Close Tab", silent = true })
  keymap.set("n", "<S-h>", "<cmd>tabprevious<cr>", { desc = "Prev buffer", silent = true })
  keymap.set("n", "<S-l>", "<cmd>tabnext<cr>", { desc = "Next buffer", silent = true })

  -- Move lines
  keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line up", silent = true })
  keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line down", silent = true })

end

return keys
