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

	-- treesitter (syntax highlighting)
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
			-- { 'saadparwaiz1/cmp_luasnip' },
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

	-- surround words with tags or quotes
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	})

	-- tag complete html tag
	use 'windwp/nvim-ts-autotag'


	-- finishing quotes and brackets
	use {
		"windwp/nvim-autopairs",
	}

	-- show line indentation
	use "lukas-reineke/indent-blankline.nvim"

	-- startup screen
	use {
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require "startup".setup()
		end
	}

	-- code formatter mostly for prettie (disabled)
	use { 'mhartington/formatter.nvim' }

	-- html snippet (disabled)
	use "rafamadriz/friendly-snippets"

	-- smart commenter
	use "terrortylor/nvim-comment"
end)
