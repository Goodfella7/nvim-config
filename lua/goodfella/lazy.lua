local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Add Lazy to runtime path
vim.opt.rtp:prepend(lazypath)

-- Step 2: Set up basic options before plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic Neovim options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Step 3: Configure plugins

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim"}
  },

  
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',      -- Required
    lazy = false,           -- Required (no lazy-loading)
    build = ":TSUpdate",    -- Required
    
      
  },


  "rebelot/kanagawa.nvim",

   
  "neovim/nvim-lspconfig",           -- Main LSP config
  "hrsh7th/nvim-cmp",                -- Autocompletion
  "hrsh7th/cmp-nvim-lsp",            -- LSP source for cmp
  "L3MON4D3/LuaSnip",                -- Snippets engine
  
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  
  
  --debugger
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-neotest/nvim-nio",

})


print("lazy set up complete")
