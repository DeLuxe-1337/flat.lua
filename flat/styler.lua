local module = {}

module.styles = {}
module.applied = {}

function module.new(name, params, theme)
    module.styles[name] = params
end

function module.use(name, element)
    local style = module.styles[name]
    if style then
        for i,v in pairs(style) do
            element.style[i:gsub("_", "-")] = v
        end
    end

    module.applied[element] = name
end

return module