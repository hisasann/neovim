local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" }) -- Common utilities

	-- Colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "ellisonleao/gruvbox.nvim" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({ "b0o/incline.nvim" })

	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "nvim-tree/nvim-web-devicons" }) -- File icons
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "onsails/lspkind-nvim" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine

	-- Formatter
	use({ "MunifTanjim/prettier.nvim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })

	-- VSCode like にする
	use("lukas-reineke/indent-blankline.nvim")

	-- If you are setting up via nvim-treesitter.configs it has been deprecated! Please migrate to the new way. It will be removed in 1.0.0.
	--use({ "windwp/nvim-ts-autotag" })

	use({ "folke/zen-mode.nvim" })

	use({ "github/copilot.vim" })

	-- git show change line
	-- so heavy
	--use({ "airblade/vim-gitgutter" })

	use({ "rcarriga/nvim-notify" })

	-- golang
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommended if need floating window support

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "glepnir/lspsaga.nvim" }) -- LSP UIs

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	use({ "MunifTanjim/nui.nvim" })
	use({ "folke/noice.nvim" })

	use({
		"nvimdev/dashboard-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
