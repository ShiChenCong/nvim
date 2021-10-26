if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = ' ',
  warn_sign = ' ',
  hint_sign = '',
  infor_sign = ' ',
  border_style = "round",
}
EOF
nnoremap <silent><M-Enter> <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent><leader>. <cmd>lua require('lspsaga.codeaction').code_action()<CR>
