
--- @module "demo.utils"
local utils = require("demo.utils")

--- @module "demo.config"
local config = require("demo.config")

--- @module "demo.config"
local main = require("demo.main")


local api = vim.api
local M = {
    default = main.default,
    opts = config.DEFAULT_OPTS,
}

local demo_namespace = api.nvim_create_namespace('demo')










local function setup_nvim_commands()
    local cmd = api.nvim_create_user_command
    cmd("DemoName",function() M.default() end,{nargs = 0 })

end


local function setup_nvim_auto_commands(opts)
    local myAutoGroup = vim.api.nvim_create_augroup("demo", {})

    local autocmd = vim.api.nvim_create_autocmd
    
    -- autocmd('Vimenter',{
    -- group = myAutoGroup,
    -- pattern = '*',
    -- nested = true,
    -- callback = function()
    --     vim.notify("Vimenter!")
    -- end
    -- })

end






M.options = {}

function M.setup(opts)
    if vim.fn.has "nvim-0.7" == 0 then
        utils.warn "demo.nvim requires Neovim 0.7 or higher"
        return
    end
    if M.setup_called then
        utils.warn "demo.nvim setup called multiple times"
        return
    end
    M.setup_called = true
    config.set(opts or {})
    local preferences = config.apply()

    --M.options  = vim.tbl_deep_extend("force",M.opts, opts or{})

    setup_nvim_commands()
    setup_nvim_auto_commands()
end


return M