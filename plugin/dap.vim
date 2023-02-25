nnoremap <silent> <leader>dd :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>dl :lua require'dap.ext.vscode'.load_launchjs()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <F9> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader><F9> :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader><F8> :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader><F7> :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader><F6> :lua require'dap'.run_last()<CR>
nnoremap <silent> <leader>pdn :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>pdf :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>pds <ESC>:lua require('dap-python').debug_selection()<CR>

nnoremap <silent> <leader>jdf :lua require('jdtls').test_class()<CR>
nnoremap <silent> <leader>jdn :lua require('jdtls').test_nearest_method()<CR>

" nnoremap <silent> <F2> :lua require'dapui'.float_element("scopes", {enter=true})<CR>
nnoremap <silent> <F3> :lua require'dapui'.float_element("stacks", {enter=true})<CR>
nnoremap <silent> <F4> :lua require'dapui'.float_element("repl", {enter=true})<CR>
nnoremap <silent> <F5> :lua require'dapui'.float_element("watches", {enter=true})<CR>


lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

