local M = {}


---The local class instance of the merged user's configuration
local config = {}


---配置元类
local Config = {}


--class constructor
function Config:new(o)
  assert(o, "User options must be passed in")
  self.__index = self
  -- save a copy of the user's preferences so we can reference exactly what they
  -- wanted after the config and defaults have been merged. Do this using a copy
  -- so that reference isn't unintentionally mutated
  self.original = vim.deepcopy(o)
  setmetatable(o, self)
  return o
end

function M.set(conf)
  config = Config:new(conf or {})
end


---Combine user preferences with defaults preferring the user's own settings
function Config:merge(defaults)
  assert(defaults and type(defaults) == "table", "A valid config table must be passed to merge")
  self.options = vim.tbl_deep_extend("keep", self.options or {}, defaults.options or {})
  return self
end




local function get_defaults()
    return{    
        options = {
            plugin_name = "demo",
    }
}
end


--- Merge user config with defaults
function M.apply()
  local defaults = get_defaults()
  config:merge(defaults)
  return config
end




return setmetatable(M, {
  __index = function(_, k)
    return config[k]
  end,
})