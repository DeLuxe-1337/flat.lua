local flat = require "flat.require"
flat.page.load_dom("flat-dom") -- loads the custom dom from render/index.html

flat.component.new("alert", function()
    local div = flat.element.create("div", "This is my alert!")

    flat.styler.new("alert", {
        border = "0.375rem",
        position = "relative",
        padding = "1rem 1rem",
        margin_bottom = "10px",
        margin_top = "10px",
        color = "#842029",
        margin_left = "10px",
        background_color = "#f8d7da",
        border_radius = "0.375rem",
        border_left_width = "10px",
        border_left_style = "solid",
        width = "fit-content"
    })

    div:render()

    flat.styler.use("alert", div)

    return {
        text = function(update)
            div.innerHTML = update
        end
    }
end)

local alert1 = flat.component.create("alert")
alert1.text("You've been warned!")

local alert2 = flat.component.create("alert")
alert2.text("This is my second warning to you.")