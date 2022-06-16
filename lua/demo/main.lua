local utils = require("demo.utils")
local con = require("demo.config")
local M = {}
function M.default()
    print(con.options.plugin_name)
end

function M.os()
    print(utils.platform .. "-" .. utils.arch)
end

function M.default_dirs()
    print("This is the default directories:")
    for key, value in pairs(utils.default_dirs) do
        print(key .. " : " .. value)
    end
end



return M
