package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local World = require("world")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local world = World.new(
  { name = "ash", x = 3, y = 1, z = 7 },
  { name = "pika", x = 3, y = 1, z = 7 }
)

print(world:look())
print(#world.log)

world.creature.z = 6

print(world:look())
print(world.log[#world.log])
print(#world.log)

check("records a meeting", function()
  local place = World.new(
    { x = 2, y = 2, z = 7 },
    { x = 2, y = 2, z = 7 }
  )
  assert(place:look() == "meet")
  assert(#place.log == 1)
end)
