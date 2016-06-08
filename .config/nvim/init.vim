"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/guillaume/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/guillaume/nvim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tsukkee/unite-tag')
call dein#add('tsukkee/unite-help')
call dein#add('tpope/vim-surround')
call dein#add('townk/vim-autoclose')
call dein#add('airblade/vim-gitgutter')
call dein#add('easymotion/vim-easymotion')
call dein#add('bling/vim-airline')
call dein#add('isRuslan/vim-es6')
call dein#add('elzr/vim-json')
call dein#add('tmhedberg/matchit')
call dein#add('gorodinskiy/vim-coloresque')
call dein#add('altercation/vim-colors-solarized')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('ternjs/tern_for_vim')
call dein#add('pangloss/vim-javascript')
call dein#add('posva/vim-vue')
call dein#add('scrooloose/syntastic')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('ekalinin/Dockerfile.vim')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

colorscheme solarized
imap jk <Space><Backspace><Esc>:w<Cr>
imap ii <Space><Backspace><Esc>
vmap ii <Esc>
se nu
se expandtab
set diffopt+=vertical
se tabstop=2
se shiftwidth=2
se noswapfile
set background=dark
autocmd BufWritePost * if &diff == 1 | diffupdate | endif
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:solarized_termcolors=256
let g:solarized_bold = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:solarized_italic = 1
let g:solarized_underline = 1
let g:solarized_contrast = "low"
let g:solarized_visibility = "high"
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:min_pattern_length = 1
let g:tern_request_timeout = 1
let g:neosnippet#expand_word_boundary = 1
let g:tern_show_signature_in_pum = 0  " This do disable full signature type on autocomplete
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
set completeopt-=preview

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc.json', '.;') != '' ? ['eslint'] : ['standard']
let g:neosnippet#enable_snipmate_compatibility = 1

let mapleader=" "
set previewheight=30
nmap <Leader>gs :Gstatus<Cr>
nmap <Leader>gc :Gcommit<Cr>
nmap <Leader>gp :Gpush<Cr>
nmap <Leader>gP :Gpush -u origin 
nmap <Leader>gb :Git checkout -b 
nmap <Leader>gg :Git 
nmap <Leader>gu :Gpull<Cr>
nmap <Leader>gf :Gfetch<Cr>
nmap <Leader>dgr :diffget //3<Cr>:diffupdate<Cr>
nmap <Leader>dgl :diffget //2<Cr>:diffupdate<Cr>
nmap <Leader>dpr :diffput //1<Cr>:diffupdate<Cr>
nmap <Leader>dpl :diffput //1<Cr>:diffupdate<Cr>
nmap <Leader>dpl :diffput //1<Cr>:diffupdate<Cr>
nmap <Leader>de :Gwrite<Cr>
nmap <Leader>db :Gdiff<Cr>

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_min_cache_files = 1200
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> <leader>ff :<C-u>Unite -smartcase -no-split -buffer-name=files  -start-insert buffer file_rec/async:! file_mru<cr>
nnoremap <silent> <leader>fp :<C-u>Unite -smartcase -no-split -buffer-name=buffer -start-insert buffer file_rec/git<cr>
nnoremap <silent> <leader>bb :<C-u>Unite -smartcase -no-split -buffer-name=files  -start-insert buffer<cr>
nnoremap <silent> <leader>pp :<C-u>Unite -smartcase -no-split -buffer-name=files -default-action=lcd -start-insert directory<cr>
nnoremap <silent> <leader>l :<C-u>Unite -smartcase -no-split -buffer-name=outline -start-insert line<cr>
nnoremap <silent> <leader><C-v> :<C-u>Unite -smartcase -no-split -buffer-name=yank  -start-insert  history/yank<cr>
nnoremap <silent> <leader>hm :<C-u>Unite -smartcase -no-split -buffer-name=mappings -start-insert -verbose mapping<cr>
nnoremap <silent> <leader>ha :<C-u>Unite -smartcase -no-split -buffer-name=actions -start-insert action<cr>
nnoremap <silent> <leader>hh :<C-u>Unite -smartcase -no-split -buffer-name=actions -start-insert help<cr>
nnoremap <silent> <leader>wq :q<Cr>
nnoremap <silent> <leader>wc :q<Cr>
vnoremap <C-c> "+y
vnoremap <C-V> "+P
noremap <Space><Space> <Plug>(easymotion-bd-w)
map gm :call cursor(0, virtcol('$')/2)<CR>
let g:EasyMotion_keys ="asdfjklé"

" Custom mappings for the unite buffer
"let g:unite_source_file_rec_async_command='ag -g'
let g:unite_source_rec_async_command =
    \ ['ag', '--follow', '--nocolor', '-p', '~/.agignore', '-p', './.agignore', '-g', '']
let g:unite_source_rec_min_cache_files = 1200
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  imap <buffer> jk      <Plug>(unite_insert_leave)
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <left>   <Plug>(unite_exit)
  nmap <buffer> <left>   <Plug>(unite_exit)
  imap <silent><buffer><expr> <right>     unite#do_action('narrow')
  nmap <silent><buffer><expr> <right>     unite#do_action('narrow')
  "imap jk <Esc>
  "imap ii <Esc>
  imap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> '     <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-p> <Esc><Esc>:cd .. <Cr>i

  nmap <silent><buffer><expr> <C-CR>     unite#do_action('lcd')
  imap <silent><buffer><expr> dd     unite#do_action('lcd')

  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction"}}}
