" Alternate way to save
inoremap <M-s> <Esc> :w<CR>
nnoremap <M-s> <Esc> :w<CR>
" Alternate way to quit
" nnoremap <A-q> <C-w>j :q<CR> :Gedit <CR>
nnoremap <A-q> :q<CR>
imap jj <Esc> :nohl <CR>

" nnoremap <F9> :set hlsearch!<CR>

" Use OSX clipboard to copy and to paste
set clipboard+=unnamedplus

nnoremap <M-j>    :resize +2<CR>
nnoremap <M-k>    :resize -2<CR>
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>

" <TAB>: completion. tab选中提示
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" nnoremap <A-n> :cn<CR>
" nnoremap <A-p> :cp<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" function! CenteredFindNext(forward)
"     " save the current value for later restore
"     let s:so_curr=&scrolloff
"     set scrolloff=999
"     try
"         if a:forward
"             silent normal! n
"         else
"             silent normal! N
"         endif
"     finally
"         " restore no matter what
"         let &scrolloff=s:so_curr
"     endtry
" endfunction

" nnoremap <silent>n :call CenteredFindNext(1)<CR>
" nnoremap <silent>N :call CenteredFindNext(0)<CR>

" Better nav for omnicomplete
" inoremap <expr> <C-j> ("\<C-n>")
" inoremap <expr> <C-k> ("\<C-p>")
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" 切换window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>cc :0Gclog<CR>
nnoremap <leader>g :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>

nnoremap <leader>cf :let @*=expand("%")<CR>
" 搜索文件
nnoremap <A-f> :FZF<CR>
" 搜索单词 如果要全匹配单词 使用 Ra
nnoremap <A-d> :Rg <CR>

" 前进光标记录
nnoremap <C-o> <C-i>
" 后退光标记录
nnoremap <C-i> <C-o>

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" 去开头
nnoremap H ^
" 去行尾 
nnoremap L $
