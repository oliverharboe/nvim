
local in_vscode = vim.g.vscode ~= nil

if not in_vscode then 
	require("core.plugins")
	require("core.keymaps")
	require("core.nvimtree")
end 

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"


-- Stave kontrol
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true             -- Aktivér stavekontrol
    vim.opt_local.spelllang = "da,en"      -- Dansk og engelsk
    vim.opt_local.wrap = true              -- Automatisk linjeombrydning
  end,
})


vim.cmd("colorscheme default")  -- du kan ændre farvetema her
