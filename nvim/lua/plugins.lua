return {
	{
   		'morhetz/gruvbox',
   		lazy = false, -- make sure we load this during startup if it is your main colorscheme
  	 	priority = 1000, -- make sure to load this before all the other start plugins
  	 	config = function()
  	 	   -- load the colorscheme here
  	 	   vim.cmd([[
  	 	  	 set background=dark
  	 	   	colorscheme gruvbox
  	 	   ]])
		end,
  	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path", -- note that an async version is available
			"hrsh7th/cmp-cmdline",
			"tamago324/cmp-zsh",
			"micangl/cmp-vimtex",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
		},
		config = function()
			local cmp = require'cmp'
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end
			window = cmp.config.window.bordered()
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" }}),
			cmp.setup.cmdline(':', {
    				mapping = cmp.mapping.preset.cmdline(),
    				sources = cmp.config.sources({
      					{ name = 'path' }
   				 }, {
     					 { name = 'cmdline' }
    				})
  			})
		end

	},
	{
                'nvim-telescope/telescope.nvim', tag = '0.1.5',
                dependencies = { 'nvim-lua/plenary.nvim' }
    	},
	{
		'folke/noice.nvim',
		dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' }
	},
	{
		'stevearc/dressing.nvim',
		event = "VeryLazy",
	},
	{
		"lervag/vimtex",
		config = function()
			vim.cmd([[
			let g:vimtex_view_method='skim'
			let g:vimtex_compiler_method='latexmk'
			let g:vimtex_quickfix_mode=1
			let g:tex_conceal='abdmg']])
		end,
		ft="tex"
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "regex", "bash", "markdown", "markdown_inline", "lua"},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				},
				indent = {enable = true},
				disable = function(lang, buf)
					local max_filesize = 10 * 1024 -- 100 KB
        				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        				if ok and stats and stats.size > max_filesize then
						return true
        				end
    				end,
			  }
			  require("nvim-treesitter.install").prefer_git = true
		  end
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
       			local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        		lspconfig.lua_ls.setup({
           			capabilities = lsp_capabilities,
        		})
			
			lspconfig.rust_analyzer.setup {}

		--	lspconfig.ocamllsp.setup {}

			lspconfig.pyright.setup {}

			lspconfig.bashls.setup {}

			lspconfig.clangd.setup {}

		
		end
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	}
}
