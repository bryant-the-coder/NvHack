local M = {}

-- Change this to your own name
local username = {
  [[██████  ██████  ██    ██  █████  ███    ██ ████████ ]],
  [[██   ██ ██   ██  ██  ██  ██   ██ ████   ██    ██    ]],
  [[██████  ██████    ████   ███████ ██ ██  ██    ██    ]],
  [[██   ██ ██   ██    ██    ██   ██ ██  ██ ██    ██    ]],
  [[██████  ██   ██    ██    ██   ██ ██   ████    ██    ]],
}

--- Center the header / ascii
---@param dict string
local function center(dict)
  local new_dict = {}
  for _, v in pairs(dict) do
    local padding = vim.fn.max(vim.fn.map(dict, "strwidth(v:val)"))
    local spacing = (" "):rep(math.floor((vim.o.columns - padding) / 2)) .. v
    table.insert(new_dict, spacing)
  end
  return new_dict
end

local morning = {
  "",
  "",
  "",
  "",
  [[ ██████   ██████   ██████  ██████      ███    ███  ██████  ██████  ███    ██ ██ ███    ██  ██████]],
  [[██       ██    ██ ██    ██ ██   ██     ████  ████ ██    ██ ██   ██ ████   ██ ██ ████   ██ ██ ]],
  [[██   ███ ██    ██ ██    ██ ██   ██     ██ ████ ██ ██    ██ ██████  ██ ██  ██ ██ ██ ██  ██ ██   ███]],
  [[██    ██ ██    ██ ██    ██ ██   ██     ██  ██  ██ ██    ██ ██   ██ ██  ██ ██ ██ ██  ██ ██ ██    ██]],
  [[ ██████   ██████   ██████  ██████      ██      ██  ██████  ██   ██ ██   ████ ██ ██   ████  ██████]],
  "",
  "",
}

local afternoon = {
  "",
  "",
  "",
  "",
  [[ ██████   ██████   ██████  ██████       █████  ███████ ████████ ███████ ██████  ███    ██  ██████   ██████  ███    ██]],
  [[██       ██    ██ ██    ██ ██   ██     ██   ██ ██         ██    ██      ██   ██ ████   ██ ██    ██ ██    ██ ████   ██]],
  [[██   ███ ██    ██ ██    ██ ██   ██     ███████ █████      ██    █████   ██████  ██ ██  ██ ██    ██ ██    ██ ██ ██  ██]],
  [[██    ██ ██    ██ ██    ██ ██   ██     ██   ██ ██         ██    ██      ██   ██ ██  ██ ██ ██    ██ ██    ██ ██  ██ ██]],
  [[ ██████   ██████   ██████  ██████      ██   ██ ██         ██    ███████ ██   ██ ██   ████  ██████   ██████  ██   ████]],
  "",
  "",
}

local night = {
  "",
  "",
  "",
  "",
  "",
  [[ ██████   ██████   ██████  ██████      ███████ ██    ██ ███████ ███    ██ ██ ███    ██  ██████  ]],
  [[██       ██    ██ ██    ██ ██   ██     ██      ██    ██ ██      ████   ██ ██ ████   ██ ██       ]],
  [[██   ███ ██    ██ ██    ██ ██   ██     █████   ██    ██ █████   ██ ██  ██ ██ ██ ██  ██ ██   ███ ]],
  [[██    ██ ██    ██ ██    ██ ██   ██     ██       ██  ██  ██      ██  ██ ██ ██ ██  ██ ██ ██    ██ ]],
  [[ ██████   ██████   ██████  ██████      ███████   ████   ███████ ██   ████ ██ ██   ████  ██████  ]],
  "",
  "",
}

local mid_night = {
  "",
  "",
  "",
  "",
  "",
  [[███████ ██      ███████ ███████ ██████  ██ ██ ]],
  [[██      ██      ██      ██      ██   ██ ██ ██ ]],
  [[███████ ██      █████   █████   ██████  ██ ██ ]],
  [[     ██ ██      ██      ██      ██            ]],
  [[███████ ███████ ███████ ███████ ██      ██ ██ ]],
  "",
  "",
}

function M.display()
  if
    not (
      (vim.api.nvim_buf_get_number(0) > 1 or vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]:len() == 0)
      and vim.api.nvim_buf_get_name(0):len() == 0
    )
  then
    return
  end

  vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(0, "buftype", "nofile")

  local time = os.date "*t"
  -- If the time is 5am / less than or equals to 11 then morning
  if time.hour == 5 or time.hour <= 11 then
    vim.api.nvim_put(center(morning), "l", true, true)
  elseif time.hour == 12 or time.hour <= 18 then
    vim.api.nvim_put(center(afternoon), "l", true, true)
    vim.api.nvim_put(center(username), "l", true, true)
  elseif time.hour == 19 or time.hour <= 22 then
    vim.api.nvim_put(center(night), "l", true, true)
  else
    vim.api.nvim_put(center(mid_night), "l", true, true)
  end

  vim.cmd [[1]]
  vim.cmd  -- DONT EVER USE AUTOCHDIR! USE IT AT YOUR OWN RISK!
  -- autochdir = auto change directory
  -- [[silent! setlocal nonu nornu autochdir ft=dashboard nocul laststatus=0 nowrap]]
 [[silent! setlocal nonu nornu ft=dashboard nocul nowrap]]

  local default = {
    colors = require("core.utils").get(),
  }
  vim.api.nvim_set_hl(0, "Orange", { fg = default.colors.orange })
  vim.api.nvim_set_hl(0, "White", { fg = default.colors.white })
  vim.fn.matchadd("Orange", "[██]")
  vim.fn.matchadd("White", "Bryant")
  vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>q!<CR>", { noremap = true, silent = true })
end

return M
