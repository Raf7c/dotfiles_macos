local opts = {}
function opts.init()
    local opt = vim.opt

    opt.fileencoding = "utf-8"
    opt.encoding = "utf-8"

    opt.number = true -- Number in front of each line
    opt.relativenumber = true
    
    opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
    opt.shiftwidth = 2

    opt.autoread = true -- Read a file when it was changed outside of nvim
    opt.autowrite = true -- Automatically write file when it was changed
    opt.mouse = "a" -- Enabled in all mode
    opt.clipboard:append("unnamedplus")
    opt.list = true -- Show space, line breaks, spaces, tabs...
    opt.listchars:append("eol:↴") -- Set the sign for the EOL
    opt.signcolumn = "yes"
    opt.wrap = false -- Long lines are not wrapped
    opt.completeopt = { "menu", "menuone", "noselect", "preview" }
    opt.splitbelow = true -- Cursor go on the left window when split
    opt.splitright = true -- Cursor go on the right windows when split
    opt.confirm = true -- Confirm before closing an unsaved buffer
    opt.cursorline = true -- Highlight current line
    opt.expandtab = true -- Use spaces instead of tabs
    opt.smartindent = true -- Insert indents automatically
    opt.winbar = "" -- Disable winbar
    
end

return opts