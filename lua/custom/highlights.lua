local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg

bg("StatusInactive", "#282c34")
bg("StatusLineNC", "#15171c")
fg_bg("StatusNormal", "#181a1f", "#98c379")
fg_bg("StatusReplace", "#181a1f", "#E5C07B")
fg_bg("StatusInsert", "#181a1f", "#61AFEF")
fg_bg("StatusCommand", "#181a1f", "#56B6C2")
fg_bg("StatusVisual", "#181a1f", "#C678DD")
fg_bg("StatusTerminal", "#181a1f", "#E06C75")
fg_bg("FileName", "#181a1f", "#E06C75")
fg("Branch", "#ffcc00")
fg("Clock", "#FF0000")
