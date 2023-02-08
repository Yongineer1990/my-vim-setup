set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set termguicolors

call plug#begin('~/.vim/plugged')

" Yes, I am a sneaky snek now
Plug 'ambv/black'

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'simrat39/symbols-outline.nvim'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'

" nvim-cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" THANKS BFREDL
Plug '/home/mpaulson/personal/contextprint.nvim'

Plug 'rust-lang/rust.vim'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-projectionist'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" HARPOON!!
Plug '/home/mpaulson/personal/rfc-reader'
Plug 'mhinz/vim-rfc'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'

" prettier
Plug 'sbdchd/neoformat'

" should I try another status bar???
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" Plug 'hoob3rt/lualine.nvim'

" git-worktree
Plug 'ThePrimeagen/git-worktree.nvim'

" wakatime
Plug 'wakatime/vim-wakatime'

" Code commenter
" Plug 'preservim/nerdcommenter'

" autotags
Plug 'craigemery/vim-autotag'

" air-line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Debug Adapter Protocol & Java / Python Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'mfussenegger/nvim-jdtls'
Plug 'rcarriga/nvim-dap-ui'

" auto-pairs
" Plug 'jiangmiao/auto-pairs'

" python indent
Plug 'Vimjas/vim-python-pep8-indent'

" HTML autoclose tag
Plug 'alvan/vim-closetag'

" indent guides
Plug 'nathanaelkane/vim-indent-guides'

" get color to rgb code
Plug 'norcalli/nvim-colorizer.lua'

" html : emmet-vim
Plug 'mattn/emmet-vim'

" vim-fish
Plug 'dag/vim-fish'

" dart/flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'

" Surround
Plug 'blackcauldron7/surround.nvim'

"Git Lens
Plug 'APZelos/blamer.nvim'

call plug#end()

" Adding local modules
" let &runtimepath.=',/home/theprimeagen/personal/harpoon/master'
" let &runtimepath.=',/home/theprimeagen/personal/vim-with-me/ui'
" let &runtimepath.=',/home/theprimeagen/personal/git-worktree.nvim/master'

" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

lua require("yongineer")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let g:vim_be_good_log_file = 1
let g:vim_apm_log = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

" paren highlight
" let loaded_matchparen = 1
let mapleader = " "

nnoremap <silent> <C-f> :lua require("harpoon.term").sendCommand(1, "tmux\n"); require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>gt <Plug>PlenaryTestFile

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

nnoremap <Leader>ww ofunction wait(ms: number): Promise<void> {<CR>return new Promise(res => setTimeout(res, ms));<CR>}<esc>k=i{<CR>

inoremap <C-c> <esc>

" tab navigation
map tt :tabnew
map <S-Right> :tabn<CR>
imap <S-Right> <ESC>:tabn<CR>
map <S-Left> :tabp<CR>
imap <S-Left> <ESC>:tabp<CR>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

" ES
com! W w

nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END


" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" customize keymapping
map <leader>\ <plug>NERDCommenterToggle

" ctags
set tags +=./tags,tags; "tags path"
nnoremap <C-[> <Esc>:po<CR>

" air-line
let g:airline_powerline_fonts = 0
let g:airline_theme = 'solarized'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_solarized_bg='dark'

" jdtls
" if has('nvim-0.5')
"   augroup lsp
"     au!
"     au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
"   augroup end
" endif

" clear search results
nnoremap <silent> // :noh<CR>

" python provider configuration
" let g:python3_host_prog = '/usr/bin/python3'

" python indent
" let g:pyindent_open_paren = '&sw * 2'
" let g:pyindent_nested_paren = '&sw'
" let g:pyindent_continue = '&sw * 2'

" indent guide
colorscheme gruvbox
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Colorizer
lua << EOF
require'colorizer'.setup{
    '*';
    DEFAULT_OPTIONS = {
        css = true
    }
}
EOF

nnoremap <leader>c :ColorizerToggle<CR>

" emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global=0
autocmd FileType html,css,eruby EmmetInstall

" dart formatting
let g:dartfmt_options = ['--fix']
nnoremap <leader>df :DartFmt<CR>

" flutter tool
nnoremap <leader>fo :FlutterOutlineToggle<CR>
nnoremap <leader>fdt :FlutterDevTools<CR>

" write file with make directory
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Surround
nnoremap <leader>ctt :lua vim.g.surround_space_on_closing_char = true<CR>
nnoremap <leader>ctf :lua vim.g.surround_space_on_closing_char = false<CR>
