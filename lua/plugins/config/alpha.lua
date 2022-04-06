local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local header = {
  type = "text",
  val = {
    [[]],
    [[ ███    ██ ██    ██ ██   ██  █████   ██████ ██   ██    ]],
    [[ ████   ██ ██    ██ ██   ██ ██   ██ ██      ██  ██     ]],
    [[ ██ ██  ██ ██    ██ ███████ ███████ ██      █████      ]],
    [[ ██  ██ ██  ██  ██  ██   ██ ██   ██ ██      ██  ██     ]],
    [[ ██   ████   ████   ██   ██ ██   ██  ██████ ██   ██    ]],
    [[                                                       ]],
    [[]],
  },
  opts = {
    position = "center",
    hl = "AlphaHeader",
  },
}
