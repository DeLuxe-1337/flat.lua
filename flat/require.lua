local js = require "js"
local window = js.global

local flat = {
    element = require"flat.element",
    page = require"flat.page",
    router = require"flat.router",
    styler = require"flat.styler",
    component = require"flat.component",
    init = function()
        function wait(delay)
            local co = assert(coroutine.running(), "Should be run in a coroutine")
        
            window:setTimeout(function()
                assert(coroutine.resume(co))
            end, delay*1000)
        
            coroutine.yield()
        end
    end
}

_G.flat = flat

return flat