" Alternate way to save
inoremap <M-s> <Esc> :w<CR>
nnoremap <M-s> <Esc> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

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

" Better tabbing
vnoremap < <gv
vnoremap > >gv

function! CenteredFindNext(forward)
    " save the current value for later restore
    let s:so_curr=&scrolloff
    set scrolloff=999
    try
        if a:forward
            silent normal! n
        else
            silent normal! N
        endif
    finally
        " restore no matter what
        let &scrolloff=s:so_curr
    endtry
endfunction

nnoremap <silent>n :call CenteredFindNext(1)<CR>
nnoremap <silent>N :call CenteredFindNext(0)<CR>
" Better nav for omnicomplete
inoremap <expr> <C-j> ("\<C-n>")
inoremap <expr> <C-k> ("\<C-p>")
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
