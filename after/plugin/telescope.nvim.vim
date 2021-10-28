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
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
      }
    }
  },
}
require('telescope').load_extension('fzf')
EOF
