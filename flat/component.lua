local module = {}
local js = require "js"

module.components = {}

function module.new(name, inside)
    module.components[name] = inside
end

function module.create(name)
    return module.components[name]()
end

return module
