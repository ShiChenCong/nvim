
source $HOME/.config/nvim/config/mappings.vim

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

if exists('g:vscode')
  " vscode plugin
  source $HOME/.config/nvim/vscode/mapping.vim
  " call plug#begin('~/.config/nvim/plugged')
  "   Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
  "   " <Leader>f{char} to move to {char}
  "   map  <Leader>f <Plug>(easymotion-bd-f)
  "   nmap <Leader>f <Plug>(easymotion-overwin-f)

  "   " s{char}{char} to move to {char}{char}
  "   nmap s <Plug>(easymotion-overwin-f2)

  "   " Move to line
  "   map <Leader>L <Plug>(easymotion-bd-jk)
  "   nmap <Leader>L <Plug>(easymotion-overwin-line)

  "   " Move to word
  "   map  <Leader>w <Plug>(easymotion-bd-w)
  "   nmap <Leader>w <Plug>(easymotion-overwin-w)
  " call plug#end()
else
  source $HOME/.config/nvim/config/setting.vim
  if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
  endif
  " let &t_Cs = "\e[4:3m"
  " let &t_Ce = "\e[4:0m"
  " if has("autocmd")                                                          
  "   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        
  " endif
  " autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
  " filetype on
  filetype plugin indent on
  " autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  " autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
  call plug#begin('~/.config/nvim/plugged')
  " 目录树
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'

  set termguicolors " this variable must be enabled for colors to be applied properly

  " a list of groups can be found at `:help nvim_tree_highlight`
  " highlight NvimTreeFolderIcon guibg=blue



  " 快速查找文件
  " Plug 'ctrlpvim/ctrlp.vim'
  " let g:ctrlp_custom_ignore = {
  "   \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  "   \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  "   \ }

  " tab标签
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim'
  nnoremap <silent><A-w>  :lua require('bufferBar').closeBuffer()<CR>
  nnoremap <silent><A-1> <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><A-2> <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><A-3> <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><A-4> <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><A-5> <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><A-6> <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><A-7> <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><A-8> <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><A-9> <Cmd>BufferLineGoToBuffer 9<CR>
  nnoremap <leader>co :BufferLineCloseRight <CR>:BufferLineCloseLeft<CR>
  nnoremap <leader>cr :BufferLineCloseRight<CR>
  nnoremap <leader>cl :BufferLineCloseLeft<CR>
  nnoremap mr :BufferLineMoveNext<CR>
  nnoremap ml :BufferLineMovePrev<CR>
  " 看板
  " Plug 'glepnir/dashboard-nvim'
  " " Plug 'liuchengxu/vim-clap'
  " let g:dashboard_default_executive ='fzf'
  " let g:dashboard_fzf_engine = 'ag'

  " 看板相关 
  " Build the extra binary if cargo exists on your system.
  " Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

  Plug 'ful1e5/onedark.nvim'

  let g:onedark_colors = {
        \ 'hint': 'orange',
        \ 'error': '#ff0000'
        \ }
  syntax enable
  " colorscheme onedark
  " colorscheme gruvbox
  " colorscheme  solarized8

  " 高亮行
  set cursorline                          " Enable highlighting of the current line
  hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=green guibg=#135564
  " hi! VertSplit guifg=black guibg=#002b36 ctermfg=black ctermbg=black

  " hi CocUnderline gui=undercurl term=undercurl
  " hi CocErrorHighlight ctermfg=red  guifg=#c4384b gui=undercurl term=undercurl
  " hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl
  " 滚动
  " Plug 'psliwka/vim-smoothie'

  " 搜索文件
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'tom-anders/telescope-vim-bookmarks.nvim'

  nnoremap ma :lua require('telescope').extensions.vim_bookmarks.all()<CR>
  nnoremap <leader>fw :lua require'telescope.builtin'.live_grep()<CR>
  nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
  nnoremap <leader>fmw :lua require'telescope.builtin'.grep_string()<CR>
  nnoremap <leader>fg :lua require('telescope.builtin').git_status()<CR>
  nnoremap <leader>fb :lua require('telescope.builtin').file_browser({ cwd = vim.fn.expand("%:p:h") })<CR>
  nnoremap <leader>fch :lua require('telescope.builtin').command_history()<CR>
  nnoremap <leader>fri :lua require('telescope.builtin').registers()<CR>
  nnoremap <leader>fp :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
  " jsx 回车 indent插件
  " Plug 'chemzqm/vim-jsx-improve'
   " Plug 'pangloss/vim-javascript'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " 完整匹配单词 且可以指定目录搜索
  command! -bang -nargs=+ -complete=dir Ra call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction

  let g:fzf_action = {
        \ 'ctrl-q': function('s:build_quickfix_list'),
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit' }
  " Plug 'mileszs/ack.vim'

  " Plug 'jiangmiao/auto-pairs'
  " let g:AutoPairsShortcutToggle = ''
  " let g:AutoPairsShortcutFastWrap = ''
  " let g:AutoPairsShortcutBackInsert = ''
  " let g:AutoPairsShortcutJump = ''
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'windwp/nvim-autopairs'

  " Plug 'tpope/vim-commentary'
  " nnoremap <M-m> :Commentary<CR>
  " vnoremap <M-m> :Commentary<CR>
  " Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'b3nj5m1n/kommentary'

  Plug 'nvim-lualine/lualine.nvim'
  " 处理代码高亮和回车自动indent
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'maxmellon/vim-jsx-pretty'

  " 修改jsx标签
  Plug 'samuelsimoes/vim-jsx-utils'
  nnoremap <leader>ct :call JSXChangeTagPrompt()<CR>
  nnoremap <leader>ce :call JSXEachAttributeInLine()<CR>
  " nnoremap vat :call JSXSelectTag()<CR>

  " git 
  Plug 'tpope/vim-fugitive'

  " 书签插件
  Plug 'MattesGroeger/vim-bookmarks'
  highlight BookmarkSign ctermbg=NONE ctermfg=160
  highlight BookmarkLine ctermbg=194 ctermfg=NONE
  let g:bookmark_sign = '♥'
  let g:bookmark_highlight_lines = 1
  " 选中添加括号插件
  Plug 'tpope/vim-surround'

  Plug 'APZelos/blamer.nvim'
  let g:blamer_delay = 500
  let g:blamer_enabled = 1
  let g:blamer_show_in_visual_modes = 0
  let g:blamer_show_in_insert_modes = 0
  let g:blamer_date_format = '%y/%m/%d'

  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

  " Plug 'rlue/vim-barbaric'
  Plug 'brooth/far.vim'
  let g:far#enable_undo=1
  set lazyredraw            " improve scrolling performance when navigating through large results

  " shortcut for far.vim find
  nnoremap <silent> <Find-Shortcut>  :Farf<cr>
  vnoremap <silent> <Find-Shortcut>  :Farf<cr>

  " shortcut for far.vim replace
  nnoremap <silent> <Replace-Shortcut>  :Farr<cr>
  vnoremap <silent> <Replace-Shortcut>  :Farr<cr>
  Plug 'tpope/vim-unimpaired'
  " Plug 'airblade/vim-gitgutter'
  " nmap ]h <Plug>(GitGutterNextHunk)
  " nmap [h <Plug>(GitGutterPrevHunk)

  Plug 'lewis6991/gitsigns.nvim'

  " Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
  " map  <Leader>f <Plug>(easymotion-bd-f)
  " nmap <Leader>f <Plug>(easymotion-overwin-f)

  " Plug 'easymotion/vim-easymotion'
  " map  <Leader>f <Plug>(easymotion-bd-f)
  " nmap <Leader>f <Plug>(easymotion-overwin-f)

  " Plug 'karb94/neoscroll.nvim'
  " Plug 'groenewege/vim-less'
  Plug 'sindrets/diffview.nvim'
  Plug 'mhinz/vim-startify'
  let g:startify_session_dir = '~/.vim/sessions'
  let g:startify_change_to_dir = 0
  let g:startify_lists = [
          \ { 'header': ['   Sessions'],       'type': 'sessions' },
          \ { 'header': ['   MRU'],            'type': 'files' },
          \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
          \ ]
  let g:startify_enable_special = 0
  Plug 'xolox/vim-session'
  let g:session_autosave = 'yes'
  let g:session_autoload = 'no'
  let g:session_autosave_to="default"
  Plug 'xolox/vim-misc'

  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  let g:VM_mouse_mappings = 1

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'rinx/lspsaga.nvim'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  let g:vsnip_snippet_dir = expand('~/.config/nvim/snip')
  imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  imap <expr><Tab> vsnip#available(1)    ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
  smap <expr><Tab> vsnip#jumpable(1)     ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
  imap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  smap <expr><S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

  "暂时不打开自动格式化 与eslint 冲突 use leader-p
  " let g:prettier#autoformat = 1
  " let g:prettier#autoformat_require_pragma = 0


  " 自动切换输入法
  Plug 'rlue/vim-barbaric'

  Plug 'norcalli/nvim-colorizer.lua'

  " emmet
  Plug 'mattn/emmet-vim'


  Plug 'ThePrimeagen/harpoon'


  Plug 'karb94/neoscroll.nvim'

  Plug 'kevinhwang91/nvim-bqf',{'ft': ':qf'}


  call plug#end()

  " lua << EOF
  " require("bufferline").setup{}
  " EOF

endif
