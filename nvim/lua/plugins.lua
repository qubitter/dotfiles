return {
	{
		"Shougo/deoplete.nvim",
		config = function()
			vim.cmd([[
				if !exists('g:deoplete#omni_patterns')
     					let g:deoplete#omni#input_patterns = {}
    				endif
				let g:deoplete#enable_at_startup = 1

				let g:deoplete#complete_method = "complete"

				call deoplete#custom#option('ignore_sources', {})

				call deoplete#custom#option('auto_complete_delay', 0)
			]])
		end,
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
		dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify'}
	},
	{
		'stevearc/dressing.nvim',
		opts = {},
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
				  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "regex", "bash", "markdown", "markdown_inline"},
				  highlight = {
					  enable = true,
					  additional_vim_regex_highlighting = false
				  },
				    indent = {enable = true}
			  }
			  require("nvim-treesitter.install").prefer_git = true
		  end
	}
}
