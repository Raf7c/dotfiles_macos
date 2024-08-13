local keymap = vim.keymap
--no arrow key allowed
keymap.set("n", "<up>", "<nop>")
keymap.set("n", "<down>", "<nop>")
keymap.set("n", "<left>", "<nop>")
keymap.set("n", "<right>", "<nop>")

--Window management
keymap.set("n", "<leader>wd", "<C-W>c")
keymap.set("n", "<leader>wy", "<C-W>s")
keymap.set("n", "<leader>wx", "<C-W>v")

-- Tab
keymap.set("n", "<leader>wtt", "<CMD>tabnew<CR>")
keymap.set("n", "<leader>wtd", "<CMD>tabclose<CR>")
keymap.set("n", "<S-h>", "<cmd>tabprevious<cr>")
keymap.set("n", "<S-l>", "<cmd>tabnext<cr>")