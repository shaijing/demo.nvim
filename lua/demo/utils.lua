local has_notify, notify = pcall(require, "notify")

local a = vim.api
local uv = vim.loop

local M = {}

M.is_windows = vim.fn.has "win32" == 1 or vim.fn.has "win32unix" == 1


function M.warn(msg)
  vim.schedule(function()
    if has_notify then
      notify(msg, vim.log.levels.WARN, { title = "Demo" })
    else
      vim.notify("[Demo] " .. msg, vim.log.levels.WARN)
    end
  end)
end




M.W = vim.log.levels.WARN
M.E = vim.log.levels.ERROR
M.I = vim.log.levels.INFO
M.D = vim.log.levels.DEBUG
--- Wrapper around `vim.notify` that adds message metadata
---@param msg string
---@param level number?
function M.notify(msg, level, opts)
  opts = opts or {}
  local nopts = { title = "Demo" }
  if opts.once then
    return vim.notify_once(msg, level, nopts)
  end
  vim.notify(msg, level, nopts)
end


return M