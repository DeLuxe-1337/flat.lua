local js = require "js"
local http = require "flat.http"

local module = {}
module.current_page_html = {}
module.dom = nil

function module.render(element)
    if element then
        local node = js.global.document:createElement(element.properties.flat_kind)
        module.dom:appendChild(node)

        table.insert(module.current_page_html, element)

        node.id = "flat_" .. #module.current_page_html
    end

    return #module.current_page_html
end

function module.load_dom(dom)
    _G.flat.init()
    _G.flat.element.page = module

    local index = http.get("scripts/render/index.html")

    js.global.document:write(index)
    js.global.document:close()

    module.dom = js.global.document:getElementById(dom)
end

return module
