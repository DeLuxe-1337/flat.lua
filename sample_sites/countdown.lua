local flat = require "lua.flat.require"
flat.page.load_dom("flat-dom") --loads the custom dom from render/index.html

local element1 = flat.element.create("h1", "Hello, world")
local element2 = flat.element.create("h3", "Percent done: 0%")

local button = flat.element.create("button", "Reset", {class = "btn btn-outline-dark"})

element1:render()
element2:render()
button:render()

element1.style = "color: red;"
element2.style = "color: blue;"

function start_count()
    local co = coroutine.create(function()
        for i = 1, 10 do
            element1.innerHTML = i .. " out of 10"
            element2.innerHTML = "Percent done: " .. math.floor(i / 10 * 100) .. "%"
            wait(.1)
        end
    end)
    coroutine.resume(co)
end

start_count()

button:event("click", function()
    start_count()
end)

print("End of main")