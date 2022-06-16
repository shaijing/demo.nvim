local has_notify, notify = pcall(require, "notify")

local a = vim.api
local uv = vim.loop
local uname = vim.loop.os_uname()


local M = {
  default_dirs = {},
}

---@alias Platform
---| '"win"'
---| '"unix"'
---| '"linux"'
---| '"mac"'

local arch_aliases = {
  ["x86_64"] = "x64",
  ["i386"] = "x86",
  ["i686"] = "x86", -- x86 compat
  ["aarch64"] = "arm64",
  ["aarch64_be"] = "arm64",
  ["armv8b"] = "arm64", -- arm64 compat
  ["armv8l"] = "arm64", -- arm64 compat
}

M.arch = arch_aliases[uname.machine] or uname.machine

if vim.fn.has "win32" == 1 or vim.fn.has "win32unix" == 1 then
  M.platform = "win"
elseif vim.fn.has "unix" == 1  then
  if vim.fn.has "linux" == 1 then
    M.platform = "linux"
  else
    M.platform = "unix"
  end
elseif vim.fn.has "mac" == 1 then
  M.platform = "mac"
end



M.is_windows = vim.fn.has "win32" == 1 or vim.fn.has "win32unix" == 1
M.default_dirs["config_dir"] = vim.fn.stdpath("config")
M.default_dirs["data_dir"] = vim.fn.stdpath("data")
M.default_dirs["cache_dir"] = vim.fn.stdpath("cache")




-- global utils functions

-- element iterator
function M.iterator(collection)
  local index = 0
  local count = #collection
  -- 闭包函数
  return function()
    index = index + 1
    if index <= count
    then
      --  返回迭代器的当前元素
      return collection[index]
    end
  end
end

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
