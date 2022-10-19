local flat = require "flat.require"
flat.page.load_dom("flat-dom") --loads the custom dom from render/index.html

local e1 = flat.element.create("h1", "Hello, world")
e1:render()

flat.styler.new("Color", {
    color = "red"
})

flat.styler.use("Color", e1)

local e2 = flat.element.create("h1", "Hello, world")
e2:render()

flat.styler.new({"Margin", "Color"}, {
    margin_left = "20%"
})

flat.styler.use("Margin", e2)
