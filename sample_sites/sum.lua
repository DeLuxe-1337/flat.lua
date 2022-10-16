local flat = require "lua.flat.require"
flat.page.load_dom("flat-dom") -- loads the custom dom from render/index.html

local result = flat.element.create("h1", "0", {
    style = "color: rgb(0, 255, 0)"
})

local plusSymbol = flat.element.create("h6", "+", {
    style = "display:inline-block; padding:10px"
})

local left = flat.element.create("input", nil, {
    type = "text",
    placeholder = "Left number"
})

local right = flat.element.create("input", nil, {
    type = "text",
    placeholder = "Right number"
})

left:render()
plusSymbol:render()
right:render()

result:render()

function onType()
    result.innerHTML = (tonumber(left.value) or 0) + (tonumber(right.value) or 0)
end

left:event("input", onType)
right:event("input", onType)