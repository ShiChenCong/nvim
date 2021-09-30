lua << EOF
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

require('telescope').setup{
	defaults = {
     file_ignore_patterns = {"node_modules"},
     layout_config = {
       width=80
     },
    },
	pickers = {
	 live_grep ={ theme= "dropdown"  },
	 find_files={ theme= "dropdown"  }
	},
}
EOF
