vim.g.mapleader = " "
vim.g.maplocalleader = ","


-- LAZY PLUGIN MANAGER

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- PLUGINS

require("lazy").setup({
	{
		"neovim/nvim-lspconfig",
 		config = function ()
			local lspconfig = require('lspconfig')
			lspconfig["texlab"].setup({})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
	  	dependencies = {
			"hrsh7th/cmp-buffer",	-- source for text in buffer
			"hrsh7th/cmp-path",		-- source for file system paths
			"onsails/lspkind.nvim", -- vs-code like pictograms
	  	},
		config = function ()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
			  	completion = {
					completeopt = "menu,menuone,preview,noselect",
			  	},
			  	mapping = cmp.mapping.preset.insert({
					["<TAB>"] = cmp.mapping.select_next_item(), 		-- next suggestion
					["<C-Space>"] = cmp.mapping.complete(), 			-- show completion suggestions
					["<CR>"] = cmp.mapping.confirm({ select = false }), -- select completion
			  	}),
			  	sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },	-- text within current buffer
        			{ name = "path" },		-- file system paths
			  	}),
			  	-- configure lspkind for vs-code like pictograms in completion menu
			  	formatting = {
					format = lspkind.cmp_format({
				  		maxwidth = 50,
				  		ellipsis_char = "...",
					}),
			  	},
			})
		end
	},
	"lervag/vimtex",
	{
		"reedes/vim-pencil",
 		config = function ()
      		vim.cmd([[SoftPencil]])
		end,
	},
	{ 
		"ellisonleao/gruvbox.nvim", 
		priority = 1000, 
 		config = function ()
			vim.o.background = "dark"
      		vim.cmd([[colorscheme gruvbox]])
		end,
  	},
	{ 
		"folke/tokyonight.nvim", 
		priority = 1000, 
 		config = function ()
			vim.o.background = "dark"
			--vim.cmd([[colorscheme tokyonight-storm]])
			--vim.cmd([[colorscheme tokyonight-night]])
			--vim.cmd([[colorscheme tokyonight-moon]])
		end,
  	},
}, {})



-- GENERAL OPTIONS

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.tabstop = 4 
vim.opt.shiftwidth = 4 
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.cindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 6
vim.opt.laststatus = 2
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.shortmess = "ltToOCFc"
vim.opt.signcolumn = "yes"

