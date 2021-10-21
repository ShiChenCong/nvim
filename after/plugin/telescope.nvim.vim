lua << EOF
local actions = require("telescope.actions")
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

require('telescope').setup{
	defaults = {
     file_ignore_patterns = {"node_modules"},
     layout_config = {
       width=180
     },
    -- file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    -- generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
	pickers = {
     -- live_grep ={ theme= "dropdown"  },
     -- find_files={ theme= "dropdown"  }
	},
  mappings = {
    i = {
        ["<esc>"] = actions.close,
    },
},
}
EOF
