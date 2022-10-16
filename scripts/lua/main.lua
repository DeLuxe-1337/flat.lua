local flat = require "flat.require"
flat.page.load_dom("flat-dom") --loads the custom dom from render/index.html

local element1 = flat.element.create("div")
element1:render()


local element2 = flat.element.create("h1", "Hello, world")
--element2:render()
element1:render_child(element2)