local flat = require "flat.require"
flat.page.load_dom("flat-dom") --loads the custom dom from render/index.html

function createText(text)
 flat.element.create("h6", text):render()
end 

for i = 1, 1000 do
createText(i)
end
