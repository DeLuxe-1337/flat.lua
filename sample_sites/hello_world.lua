local flat = require "lua.flat.require"
flat.page.load_dom("flat-dom") --loads the custom dom from render/index.html

local element1 = flat.element.create("h1", "Hello, world")
element1:render()
