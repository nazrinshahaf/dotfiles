-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- so and :PackerSync

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- tokyonight colourscheme
	use 'folke/tokyonight.nvim'

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		{ run = ':TSUpdate' }
	}

	-- harpoon
	use 'theprimeagen/harpoon'

	-- undotree
	use 'mbbill/undotree'

	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		},
	}
	-- multiplexer navigator
	use {
		'numToStr/Navigator.nvim',
		config = function()
			require('Navigator').setup()
		end
	}

	-- bar at the bottom
	use {
		'feline-nvim/feline.nvim',
		requires = {
			-- git signs dependancy for feline
			use 'lewis6991/gitsigns.nvim',
		}
	}


	-- nvim tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
		config = function()
			require("nvim-tree").setup {}
		end
	}

	-- tabline at the top
	use {
		'crispgm/nvim-tabline',
		requires = {
			'nvim-tree/nvim-web-devicons',
		}
	}
end)
