" TODO: organise this file
" Move parts into seperate files:
"   - Keybinds          (  keybinds.vim )
"   - Plugins           (  plugins.vim  )
"   - Plugin configs    (  plugconf.vim )
"   - Other configs     (  Leave here   )

set nocompatible
filetype off

augroup VimReload
    autocmd!
    autocmd BufWritePost  $MYVIMRC  source $MYVIMRC
augroup END


" TODO: make sure everything still works since changing from $HOME to
" $XDG_CONFIG_HOME
set rtp+=$XDG_CONFIG_HOME/vim
" TODO: move dein plugins into bundle/ now that Vundle is gone
set rtp+=$XDG_CONFIG_HOME/vim/dein/repos/github.com/Shougo/dein.vim



" Dein, the next generation of vim plugin manager
" TODO: change the expansion here to use $XDG_CONFIG_HOME
call dein#begin(expand('~/.config/vim/dein'))

" Let dein manage dein, required
call dein#add('Shougo/dein.vim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" Quality of Life plugins
"""""""""""""""""""""""""
" CoC.nvim: The Conqueror of Completion
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
" Speed up Vim by updating folds only when called-for.
call dein#add('Konfekt/FastFold')
" vim-snipmate default snippets (Previously snipmate-snippets)
call dein#add('honza/vim-snippets')
" EditorConfig plugin for Vim
call dein#add('editorconfig/editorconfig-vim')
" fzf <3 vim
call dein#add('junegunn/fzf.vim')
" Swap your windows without ruining your layout
call dein#add('wesQ3/vim-windowswap')  " <leader>ww to mark/swap windows
" Identify and Irradicate unwanted whitespace at the end of the line
call dein#add('csexton/trailertrash.vim')  " <F5> to remove trailing whitespace

" Visual plugins
""""""""""""""""
" Colour schemes
call dein#add('flazz/vim-colorschemes')
" Preview colours in source code while editing
call dein#add('ap/vim-css-color')
" ARMv4 through 7 syntax highlighting for vim
call dein#add('ARM9/arm-syntax-vim')

" Document formatting plugins
"""""""""""""""""""""""""""""
" VimTeX: A modern Vim and neovim filetype plugin for LaTeX files.
call dein#add('lervag/vimtex')
" pandoc integration and utilities for vim
call dein#add('vim-pandoc/vim-pandoc')
" pandoc markdown syntax, to be installed alongside vim-pandoc
call dein#add('vim-pandoc/vim-pandoc-syntax')
" Vim plugin to work with R
call dein#add('jalvesaq/Nvim-R', { 'branch': 'stable' })
" A Narrow Region Plugin for vim (like Emacs Narrow Region)
call dein#add('chrisbra/NrrwRgn')

" Tim Pope plugins
""""""""""""""""""
" fugitive.vim: A Git wrapper so awesome, it should be illegal
call dein#add('tpope/vim-fugitive')
" surround.vim: Delete/change/add parentheses/quotes/XML-tags/much more with
" ease
call dein#add('tpope/vim-surround')
" repeat.vim: enable repeating supported plugin maps with "."
call dein#add('tpope/vim-repeat')
" dispatch.vim: Asynchronous build and test dispatcher
" TODO: use this more - set makeprg for filetypes without plugins
call dein#add('tpope/vim-dispatch')

" Airblade plugins
""""""""""""""""""
" Changes Vim working directory to project root.
call dein#add('airblade/vim-rooter')
" A Vim plugin which shows git diff markers in the sign column and
" stages/previews/undoes hunks and partial hunks.
call dein#add('airblade/vim-gitgutter')
" Ensure Vim's help docs always open in their own, single tab.
call dein#add('airblade/vim-helptab')

" End of dein plugin list
call dein#end()



"call vundle#begin()
" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

"Plugin 'StanAngeloff/php.vim'
"call vundle#end()



"let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Fuzzy search the current file with <C-/> (vim registers this as <C-_>)
nnoremap <C-_> :BLines<CR>


let g:rooter_silent_chdir = 1
let g:rooter_patterns = ['.git', 'src/', 'build/']

" <F5> to trim trailing spaces from a file
nmap <F5> :TrailerTrim<CR>

filetype plugin indent on
syntax on

" Leader key '\'
let mapleader="\\"
let maplocalleader="\\"

set path+=**
set wildmenu
set wildignore+=**/.git/**
set wildignorecase

set hidden

set updatetime=300

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

set tabstop=4

set shiftwidth=4
set expandtab

set nojoinspaces " Only one space after a period to break sentences

set backspace=2

" Completion with C-p:
" . - current buffer
" w - any other windows open in the current tab
" b - any other buffers open in any tab
" u - unloaded buffers
" t - tags file (from ctags)
" i - included files (if using a programming language with include)
" kspell - spelling dictionary (only if spellcheck is enabled)
set complete=.,w,b,u,t,i,kspell

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-N> :tabn<CR>
nnoremap <C-P> :tabp<CR>
nnoremap <C-T> :tabnew<CR>
nnoremap <leader>t :terminal ++curwin<CR>
nnoremap <leader>vt :vert terminal<CR>


vmap <expr> <LEFT>  DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN>  DVB_Drag('down')
vmap <expr> <UP>    DVB_Drag('up')
vmap <expr> D       DVB_Duplicate()
let g:DVB_TrimWS = 1

set tabpagemax=24

set splitbelow
set splitright


set number relativenumber
set ruler

set ic incsearch
set smartcase

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%82v', 100)

exec "set listchars=tab:\uBB\uBB,nbsp:~,trail:\uB7"
set list

execute pathogen#infect()
call pathogen#helptags()

" Recursively search for files by their name
nnoremap <C-f> :Files<CR>
" RipGrep - grep through files in the current directory
nnoremap <C-g> :Rg<CR>
" Search through tags for the project
" FIXME: find an unused keybind that makes sense for searching tags (e.g.
" Variables, KeyWords, Tokens, etc.) - or maybe just assign it to
" <leader>t/s/g/...
"nnoremap <C-S-g> :Tags<CR>

" Toggle spellcheck
nnoremap <silent> <Leader>s :setlocal spell!<CR>

set showcmd


" Setting filetypes for problematic file extensions
autocmd BufRead,BufNewFile *.ms setlocal filetype=groff
autocmd BufRead,BufNewFile *.h  setlocal filetype=c

" Formatting options for C source code
autocmd FileType c setlocal formatoptions=croqnlj
"autocmd FileType c setlocal formatprg='clang-format --style=file'


autocmd FileType arduino setlocal smartindent


" DOCUMENT PREPARATION
""""""""""""""""""""""
" TODO: use a makeprg in autocmd/filetype and then bind <F2> to :make (or the
" async version from that tpope(?) plugin) for a variety of filetypes.
autocmd FileType groff nnoremap <buffer> <F2> :w<CR>:call job_start(['/bin/sh', '-c', "groff -R -t -p -e -k -ms -Tps <C-R>% \| ps2pdf - ".expand('%:r').".pdf"])<CR><CR>
autocmd FileType groff inoremap <buffer> <F2> <Esc><F2>

autocmd FileType markdown nnoremap <buffer> <F2> :w<CR>:call job_start(['/bin/sh', '-c', "pandoc --pdf-engine=xelatex -tpdf <C-R>% > .".expand('%:r').".pdf && mv .".expand('%:r').".pdf ".expand('%:r').".pdf"])<CR>
autocmd FileType markdown inoremap <buffer> <F2> <Esc><F2>

" Using Nvim-R for compiling rmarkdown documents
autocmd FileType rmd nnoremap <buffer> <F2> :call RMakeRmd("default")<CR>
autocmd FileType rmd inoremap <buffer> <F2> <Esc><F2>
"set nofoldenable

let g:tex_flavor = "latex"
let g:vimtex_fold_enabled = 1

" Compile latex documents asynchronously with Vimtex
autocmd FileType tex nnoremap <buffer> <F2> :w<CR>:VimtexCompile<CR>
autocmd FileType tex nnoremap <buffer> <F3> :w<CR>:VimtexClean<CR>
autocmd FileType tex inoremap <buffer> <F2> <Esc><F2>


"augroup VimCompletesMeTex
"    autocmd!
"    autocmd FileType tex
"        \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
"augroup END

augroup vimtex_config
  autocmd!
  autocmd User VimtexQuit call vimtex#latexmk#clean(0)
augroup END

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-xelatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \   '-synctex=1',
    \ ],
    \ 'build_dir' : 'build'
    \}
let g:vimtex_view_method = 'zathura'


" CoC: Conqueror of Completion
""""""""""""""""""""""""""""""
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" CoC extensions
let g:coc_global_extensions = [
            \ 'coc-vimlsp',
            \ 'coc-snippets',
            \ 'coc-vimtex',
            \ 'coc-json',
            \ 'coc-clangd'
\]

" TODO: setup more CoC details/settings

" SNIPPETS
""""""""""
" coc-snippets configuration
"vmap <C-S> <Plug>(coc-snippets-select)
" TODO: after expanding a snippet do :unlet coc_selected_text
let g:snips_author="Sam Whitehead"
let g:snips_email="sam.everythingcomputers@gmail.com"
let g:snips_github="https://github.com/Ytrewq13"

nnoremap <C-S> :unlet coc_selected_text<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use <CR> to accept and expand a snippet suggestion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


autocmd BufEnter *.asm silent! setlocal ft=nasm
autocmd BufNewFile,BufRead *.s,*.S silent! setlocal filetype=arm " arm = armv6/7


" Grep for a string in the project, put the results into the quickfix list
set grepprg=ag\ --vimgrep
function! Grep(...)
    return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
" Abbreviations for :grep and :lgrep
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'
" Redraw the quickfix list whenever it is updated
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END


" For basic statistical analysis of a small group of numbers
xmap <silent><expr>  ++  VMATH_YankAndAnalyse()
nmap <silent>        ++  vip++

" Don't use the arrow keys in normal mode
nnoremap <Left> <nop>
nnoremap <Up> <nop>
nnoremap <Right> <nop>
nnoremap <Down> <nop>

" Ron
colorscheme ron
nnoremap <F12> :colorscheme ron<CR>
" Colourscheme 3dglasses
"colorscheme 3dglasses
"nnoremap <F12> :colorscheme 3dglasses<CR>
highlight CocFloating ctermbg=darkgrey ctermfg=lightgrey
highlight CocErrorSign ctermfg=red

" Automatically change the local working directory when editing a new file
autocmd BufEnter * silent! lcd %:p:h

" Common Abbreviations
ab hte the
ab teh the
ab Teh The
ab wiht with
ab funciton function
ab funcitons functions
ab Funciton Function
ab Funcitons Functions
ab itme item
