local ordered_list = flat.element.create("ol")
ordered_list:render()

local list = {"Wash dishes", "Ride bike", "Do homework"}

function listItems()
   ordered_list:clear_children()

   for i,v in pairs(list) do
	ordered_list:render_child(flat.element.create("li", v))
   end
end

listItems()

--interactability

local add = flat.element.create("button", "Add")
local input = flat.element.create("input")

add:render()
input:render()

add:event("click", function() 
   table.insert(list, input.value)
   listItems()
end)
