local status_ok, twilight = pcall(require, "twilight")
if not status_ok then
  return
end

twilight.setup {
  dimming = {
      alpha = 0.25, -- amount of dimming
      color = { "Normal", "#ffffff" },
      inactive = true,
  },
  context = 15,
  treesitter = true,
  expand = {
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {},}
