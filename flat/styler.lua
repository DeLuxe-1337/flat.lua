local module = {}

module.styles = {}
module.applied = {}

local style_metatable = {
    __add = function (t1, t2)
        local ret = {}
        for i, v in pairs(t1) do
            ret[i] = v
        end

        for i, v in pairs(t2) do
            ret[i] = v
        end

        return ret
    end,
}

function module.new(name, params)
    if type(name) == "string" then
        module.styles[name] = setmetatable(params, style_metatable)
    elseif type(name) == "table" then
        local new_name = name[1]
        local inherited_params = setmetatable({}, style_metatable)

        for i,v in pairs(name) do
            if v ~= new_name then
                local style = module.styles[v]
                if style then
                    inherited_params = inherited_params + style
                end
            end
        end
        
        inherited_params = inherited_params + setmetatable(params, style_metatable)

        module.styles[new_name] = inherited_params
    else
        error("Flat: Failed to create new style " .. tostring(name))
    end
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