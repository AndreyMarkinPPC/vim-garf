if exists("g:garf_command")
	let garf_cmd=g:garf_command
else
	let garf_cmd="garf"
endif

if !exists("g:garf_logger")
		let garf_logger="local"
endif

if !exists("g:garf_output")
		let garf_output="console"
endif

function! CallGarf(range, query)
	silent !clear
	echomsg "Running garf command"
	if !exists("g:garf_source")
		let g:garf_source  = input("Select source: ")
	endif
	if a:range != 0 || !empty(a:query)
		let l:garf_query = a:query
		let l:garf_query = substitute(l:garf_query, "\n", " ", "g")
		let l:file_path = shellescape(l:garf_query)  . " --input=console "
	else
		let l:file_path = shellescape(expand('%'))
	endif
	if exists('g:garf_config')
		let l:cmd = g:garf_cmd . " " . l:file_path
					\ . " --source=" . g:garf_source
					\ . " --config=" . g:garf_config
					\ . " --loglevel=" . g:garf_logging
					\ . " --logger=" . g:garf_logger
	else
		let l:cmd = g:garf_cmd . " " . l:file_path
					\ . " --source=" . g:garf_source
					\ . " --output=" . g:garf_output
					\ . " --loglevel=" . g:garf_logging
					\ . " --logger=" . g:garf_logger
					\ . " --source." . g:source_param
	endif
	if exists(':Dispatch')
		execute "Dispatch " .  l:cmd
	else
		execute "!" .  l:cmd
	endif
endfunction

command! -range=% -nargs=? Garf <line1>,<line2> call CallGarf(<range>, <q-args>)
xmap <silent> <localleader>grf :Garf<CR>
nnoremap <silent> <localleader>grf :Garf<CR>
