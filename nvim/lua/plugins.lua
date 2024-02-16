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
		"vim-syntastic/syntastic",
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
				  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "regex", "bash", "markdown", "markdown_inline", "lua"},
				  highlight = {
					  enable = true,
					  additional_vim_regex_highlighting = false
				  },
				    indent = {enable = true}
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

			lspconfig.ocamllsp.setup {}

			lspconfig.pyright.setup {}

			lspconfig.bashls.setup {}

			lspconfig.clangd.setup {}

		
		end
	}
}
