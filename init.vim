
source $HOME/.config/nvim/config/mappings.vim
if exists('g:vscode')
  " vscode plugin
else
  source $HOME/.config/nvim/config/setting.vim
  if has("nvim")
    let g:plug_home = stdpath('data') . '/plugged'
  endif
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"
  if has("autocmd")                                                          
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                        
  endif
  " autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
  " filetype on
  " filetype plugin indent on
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

  " 代码补全  
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  nmap <silent> [g <Plug>(coc-diagnostic-prev) " 上一个eslint错误
  nmap <silent> ]g <Plug>(coc-diagnostic-next) " 下一个eslin错误
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references-used)
  " nmap <silent> gf  <Plug>(coc-codeaction)
  nnoremap <A-n> :CocNext<cr>
  nnoremap <A-p> :CocPrev<cr>
  nnoremap <A-c> :CocList --normal location<cr>
  " xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>as  <Plug>(coc-codeaction-selected)<CR>
  " nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>.  <Plug>(coc-fix-current) " 修复当前行

  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " 回车选中补全，而不是换行
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else           
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 
  endif

  " 触发提示
  if has('nvim')
    inoremap <silent><expr> <C-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif
  let g:coc_enable_locationlist = 0
  autocmd User CocLocationsChange CocList --normal location
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
  " 看板
  " Plug 'glepnir/dashboard-nvim'
  " " Plug 'liuchengxu/vim-clap'
  " let g:dashboard_default_executive ='fzf'
  " let g:dashboard_fzf_engine = 'ag'

  " 看板相关 
  " Build the extra binary if cargo exists on your system.
  " Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }


  " 主题
  " Plug 'joshdick/onedark.vim'
  " Plug 'sheerun/vim-polyglot'
  Plug 'ful1e5/onedark.nvim'
  syntax enable
  colorscheme  solarized8
  " lua << EOF
  "  require("onedark").setup()
  " EOF
  " 高亮行
  set cursorline                          " Enable highlighting of the current line
  hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=green guibg=#135564
  hi! VertSplit guifg=black guibg=#002b36 ctermfg=black ctermbg=black

  " hi CocUnderline gui=undercurl term=undercurl
  " hi CocErrorHighlight ctermfg=red  guifg=#c4384b gui=undercurl term=undercurl
  " hi CocWarningHighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl
  " 滚动
  " Plug 'psliwka/vim-smoothie'

  " 搜索文件
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

  " jsx 回车 indent插件
  " Plug 'chemzqm/vim-jsx-improve'
   " Plug 'pangloss/vim-javascript'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " 完整匹配单词 且可以指定目录搜索
  command! -bang -nargs=+ -complete=dir Ra call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
  " Plug 'mileszs/ack.vim'

  Plug 'jiangmiao/auto-pairs'
  let g:AutoPairsShortcutToggle = ''
  let g:AutoPairsShortcutFastWrap = ''
  let g:AutoPairsShortcutBackInsert = ''
  let g:AutoPairsShortcutJump = ''
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'tpope/vim-commentary'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'

  " Plug 'hoob3rt/lualine.nvim'
  Plug 'shadmansaleh/lualine.nvim'
  " 处理代码高亮和回车自动indent
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'

  " 修改jsx标签
  Plug 'samuelsimoes/vim-jsx-utils'
  nnoremap <leader>jc :call JSXChangeTagPrompt()<CR>
  nnoremap vat :call JSXSelectTag()<CR>

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

  Plug 'unblevable/quick-scope'       " Plug
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

  Plug 'APZelos/blamer.nvim'
  let g:blamer_delay = 500
  let g:blamer_enabled = 1
  let g:blamer_show_in_visual_modes = 0
  let g:blamer_show_in_insert_modes = 0
  let g:blamer_date_format = '%y/%m/%d'

  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'rlue/vim-barbaric'
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
  Plug 'airblade/vim-gitgutter'
  nmap ]h <Plug>(GitGutterNextHunk)
  nmap [h <Plug>(GitGutterPrevHunk)
  Plug 'stsewd/fzf-checkout.vim'
  nmap <A-b> :GBranches<CR>
  Plug 'easymotion/vim-easymotion'
  map  <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)
  Plug 'karb94/neoscroll.nvim'
  Plug 'groenewege/vim-less'
  Plug 'sindrets/diffview.nvim'
  Plug 'mhinz/vim-startify'
  let g:startify_session_dir = '~/.vim/sessions'
  let g:startify_lists = [
          \ { 'header': ['   Sessions'],       'type': 'sessions' },
          \ { 'header': ['   MRU'],            'type': 'files' },
          \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
          \ ]
  let g:startify_enable_special = 0
  Plug 'xolox/vim-session'
  let g:session_autosave = 'yes'
  let g:session_autoload = 'no'
  Plug 'xolox/vim-misc'

  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  let g:VM_mouse_mappings = 1
  call plug#end()

  " lua << EOF
  " require("bufferline").setup{}
  " EOF

endif
