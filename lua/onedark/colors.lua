local util = require("onedark.util")
local configModule = require("onedark.config")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or configModule.config

  -- Color Palette
  ---@class ColorScheme
  local colors = {
    none = "NONE",
    bg = "#282c34",
    bg2 = "#21252b",
    bg_visual = "#393f4a",
    border = "#646e82",
    bg_highlight = "#2c313a",
    fg = "#abb2bf",
    fg_light = "#adbac7",
    fg_dark = "#798294",
    fg_gutter = "#5c6370",
    dark5 = "#abb2bf",
    blue = "#61afef",
    cyan = "#56b6c2",
    purple = "#c678dd",
    orange = "#d19a66",
    yellow = "#e0af68",
    yellow2 = "#e2c08d",
    bg_yellow = "#ebd09c",
    green = "#98c379",
    red = "#e86671",
    red1 = "#f65866",
    git = {change = "#e0af68", add = "#109868", delete = "#9A353D", conflict = "#bb7a61"},
    gitSigns = {change = "#e0af68", add = "#109868", delete = "#9A353D"},

    cursor = "#528bff",
    syntax = {
      string = "#98c379",
      variable = "#e06c75",
      operator = "#56b6c2",
      property = "#56b6c2",
      variable_builtin = "#e5c07b",
      js = {
        func = "#e5c07b",
        variable = "#e5c07b",
        property = "#61afef",
        tag_attribute = "#e59b4e"
      },
      json = {label = "#e06c75"},
      less = {include = "#c678dd", class = "#d19a66"},
      make = {ident = "#e59b4e"},
      php = {punct_bracket = "#e06c75", keyword = "#56b6c2", constructor = "#e5c07b"},
      python = {param = "#e59b4e", builtin_func = "#56b6c2"},
      ruby = {symbol = "#56b6c2", variable = "#61afef", param = "#e5c07b"},
      scss = {property = "#e59b4e", string = "#98c379", type = "#e06c75"},
      bash = {builtin_func = "#56b6c2"},
      sql = {fold = "#e59b4e", keyword = "#c678dd"},
      ts = {
        constructor = "#61afef",
        keyword = "#c678dd",
        method = "#c678dd",
        property = "#e06c75",
        variable = "#e5c07b"
      },
      xml = {attrib = "#e06c75", tag_name = "#e06c75"},
      yaml = {field = "#e06c75"}
    },

    devIcons = {
      c = "#519aba",
      clojure = "#8dc149",
      coffeescript = "#cbcb41",
      csharp = "#519aba",
      css = "#519aba",
      markdown = "#519aba",
      go = "#519aba",
      html = "#e37933",
      java = "#cc3e44",
      javascript = "#cbcb41",
      json = "#cbcb41",
      less = "#519aba",
      make = "#e37933",
      mustache = "#e37933",
      php = "#a074c4",
      python = "#4e93b3",
      ruby_on_rails = "#cc3e44",
      ruby = "#cc3e44",
      sass = "#f55385",
      scss = "#f55385",
      shellscipt = "#4d5a5e",
      sql = "#f55385",
      typescript = "#519aba",
      xml = "#e37933",
      yml = "#a074c4"
    }
  }

  util.bg = colors.bg

  colors.lualine = {
    normal = {
      a = {bg = colors.green, fg = colors.black},
      b = {bg = colors.fg_gutter, fg = colors.green},
      c = {bg = colors.bg_statusline, fg = colors.fg_sidebar}
    },
    insert = {
      a = {bg = colors.blue, fg = colors.black},
      b = {bg = colors.fg_gutter, fg = colors.blue}
    },
    command = {
      a = {bg = colors.purple, fg = colors.black},
      b = {bg = colors.fg_gutter, fg = colors.purple}
    },
    visual = {
      a = {bg = colors.yellow, fg = colors.black},
      b = {bg = colors.fg_gutter, fg = colors.yellow}
    },
    replace = {
      a = {bg = colors.red, fg = colors.black},
      b = {bg = colors.fg_gutter, fg = colors.red}
    }
  }

  colors.diff = {
    add = util.darken(colors.git.add, 0.15),
    delete = util.darken(colors.git.delete, 0.15),
    change = util.darken(colors.git.change, 0.15),
    text = colors.fg_gutter
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2)
  }

  colors.git.ignore = colors.fg_gutter
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.blue

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg2
  colors.bg_statusline = colors.bg2

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.darkSidebar and colors.bg2 or colors.bg
  colors.bg_sidebar = config.transparent and colors.none or colors.bg_sidebar
  colors.bg_float = config.darkFloat and colors.bg2 or colors.bg

  colors.bg_search = colors.bg_yellow
  colors.fg_search = colors.bg2
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.cyan

  util.color_overrides(colors, config)

  return colors
end

return M
