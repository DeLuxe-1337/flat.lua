local flat = require "flat.require"
flat.page.load_dom("flat-dom") -- loads the custom dom from render/index.html

local leftnav = flat.element.create("div", nil)

flat.styler.new("leftnav", {
    overflow_x = "hidden",
    position = "fixed",
    width = "10%",
    height = "100%",
    background_color = "rgb(45, 45, 45)",
    border = "none",
    text_align = "center"
})

leftnav:render()

flat.styler.use("leftnav", leftnav)

local pages = {}

flat.component.new("docpage", function()
    local page_div = flat.element.create("div", nil)

    flat.styler.new("page", {
        position = "relative",
        color = "rgb(255, 255, 255)",
        width = "80%",
        display = "inline-block",
        text_align = "center",
        margin_left = "11%"
    })

    page_div:render()

    flat.styler.use("page", page_div)

    table.insert(pages, page_div)

    return {
        get = page_div
    }
end)

function removeAllPages()
    for i, v in pairs(pages) do
        v:remove()
        table.remove(pages, i)
    end
end

flat.component.new("nav_option", function()
    local div = flat.element.create("div", "This is a nav option!")

    flat.styler.new("navopt", {
        position = "relative",
        color = "rgb(255, 255, 255)",
        width = "100%",
        display = "inline-block",
        user_select = "none",
        margin_bottom = "1%"
    })

    div:render()
    leftnav:render_child(div)

    flat.styler.use("navopt", div)

    return {
        bind = function(update, fn)
            div.innerHTML = update

            div:event("click", function()
                removeAllPages()
                local page = flat.component.create("docpage")
                fn(page.get)
            end)
        end
    }
end)

local doc_components = {
    text = function(size, text, div, center)
        center = center or false

        local text = flat.element.create(size, text)
        text:render()
        div:render_child(text)

        if center then
            text.style = "display: inline-block;"
        end
    end
}

flat.component.create("nav_option").bind("Components", function(div)
    doc_components.text("h1", "- Components -", div, true)

    doc_components.text("h2",
        "You can create components using: flat.component.new(name: string, component_content: function);", div)
    doc_components.text("h2", "You can use components by using: flat.component.create(name: string);", div)
end)

flat.component.create("nav_option").bind("Styler", function(div)
    doc_components.text("h1", "- Styler -", div, true)

    doc_components.text("h2",
        "You can create styles using: flat.styler.new(name: string, style_properties: table);", div)
    doc_components.text("h2", "You can use styles by using: flat.styler.use(name: string, element: element);", div)
end)
