-- Funktion til at sikre, at Packer er installeret
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()  -- Sætter packer_bootstrap til sandt, hvis Packer blev installeret

-- Brug Packer til at installere plugins
return require("packer").startup(function(use)
  -- Packer selv
  use "wbthomason/packer.nvim"  

  -- Fuzzy finder - Telescope
  use { 
    "nvim-telescope/telescope.nvim", 
    requires = { "nvim-lua/plenary.nvim" } 
  }

  -- Nvim Tree
  use { 
    "nvim-tree/nvim-tree.lua", 
    requires = { "nvim-tree/nvim-web-devicons" } 
  }

  -- Hvis Packer blev installeret under opstarten, synkroniser plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

