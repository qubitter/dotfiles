--let g:opamshare = substitute(system('opam var share'),'\n$','','''')
--execute "set rtp+=" . g:opamshare . "/merlin/vim"

function popen(command)
	local handle = io.popen(command)
	local result = handle:read("*a")
	handle:close()
	return result
end

local opamshare = popen('opam var share'):gsub('\n$', '')

vim.cmd('helptags '..opamshare.."/merlin/vim/doc")

vim.cmd('set rtp+='..opamshare.."/merlin/vim")

vim.cmd('set rtp^="/Users/charliebershatsky/.opam/4.14.1/share/ocp-indent/vim"')

vim.cmd('let g:merlin=1')



vim.cmd([[
	call deoplete#custom#option('ignore_sources.ocaml', ['buffer', 'around', 'member', 'tag'])
	let g:deoplete#omni#input_patterns.ocaml = '[^. *\\t]\\.\\w*\\|\\h\\w*|#']])

vim.cmd("let g:syntastic_ocaml_checkers = ['merlin']")
vim.cmd('setlocal tabstop=2')
