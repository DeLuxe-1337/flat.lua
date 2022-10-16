--not functional, yet.

local module = {}

local js = require "js"
local window = js.global

function module.set_route(name)
    print(window.history.pushState)
    window.history:pushState(nil, "", name)
end

return module