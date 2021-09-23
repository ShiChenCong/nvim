lua << EOF
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
EOF
