local con = require("demo.config")

local M = {}


function M.default()
    print(con.options.plugin_name)
end


return M