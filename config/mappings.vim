let g:mapleader = "\<Space>"

nnoremap <silent><Backspace> :noh<CR>

" Alternate way to save
inoremap <A-s> <Esc> :w<CR>
nnoremap <A-s> <Esc> :w<CR>
inoremap <A-a> <Esc> :wq<CR>
nnoremap <A-a> <Esc> :wq<CR>
" Alternate way to quit
" nnoremap <A-q> <C-w>j :q<CR> :Gedit <CR>
nnoremap <A-q> :q<CR>
imap jj <Esc> 

" nnoremap <F9> :set hlsearch!<CR>

nnoremap <leader><M-j>    :resize +2<CR>
nnoremap <leader><M-k>    :resize -2<CR>
nnoremap <leader><M-h>    :vertical resize +2<CR>
nnoremap <leader><M-l>    :vertical resize -2<CR>

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
"             silent normal! n
nnoremap <leader>g :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>

nnoremap <leader>cf :let @*=expand("%")<CR>
" 搜索文件
nnoremap <A-f> :FZF<CR>
" 搜索单词 如果要全匹配单词 使用 Ra
nnoremap <A-d> :Rg <CR>
nnoremap <A-h> :History <CR>

" 前进光标记录
nnoremap <A-o> <C-i>
" 后退光标记录 
nnoremap <A-i> <C-o>
 
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
inoremap <M-j> <esc>:m .+1<CR>==
inoremap <M-k> <esc>:m .-2<CR>==
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==

" 去开头
nnoremap H ^
vnoremap H ^
" 去行尾 
nnoremap L $
vnoremap L $

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录

" inoremap <C-l>    <Right>
" cnoremap <C-l>    <Right>
" inoremap <C-i>    <Left>
" cnoremap <C-i>    <Left>

" inoremap <C-j>    <Down>
" inoremap <C-k>    <Up>

nmap ss :split<Return>
nmap sv :vsplit<Return>

noremap p gp
noremap P gP
noremap gp p
noremap gP P


nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

