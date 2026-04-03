local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local colors = require("colors.colors")

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git","--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			transparent_background = true,
			custom_palette = colors.palete,
		}
	},
	"brenoprata10/nvim-highlight-colors",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
    -- { "typicode/bg.nvim", lazy = false },

    {
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},

	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",  -- lsp auto-completion
			"hrsh7th/cmp-buffer",    -- buffer auto-completion
			"hrsh7th/cmp-path",      -- path auto-completion
			"hrsh7th/cmp-cmdline",   -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},

	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},

    -- Cool status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
})
