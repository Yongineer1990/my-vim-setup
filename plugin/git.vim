nnoremap <leader>gf :Git fetch --all<CR>
nnoremap <leader>ga :Git add --all<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nnoremap <leader>gm :BlamerToggle<CR>

nmap <leader>gd :Gvdiff<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
" nmap <leader>gm :Git blame<CR>

" Git Lens
let g:blamer_delay = 500
let g:blamer_date_format = '%y/%m/%d %H:%M'
