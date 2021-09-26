lua << EOF
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

require('telescope').setup{
	defaults = { file_ignore_patterns = {"node_modules"} },
	  pickers = {
	     find_files = {
	       theme = "dropdown",
	     },
	 live_grep ={ theme= "dropdown"  }
	 },
}
EOF
