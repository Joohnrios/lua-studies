package.path = "./lessons/30-player/examples/?.lua;" .. package.path

local Player = require("player")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local ash = Player.new("ash", 40, { x = 10, y = 4, z = 7 })

print(ash.name)

local x, y, z = ash:move(2, -1)

print(x)
print(y)
print(z)
print(ash:damage(15))
print(ash:damage(100))

check("keeps the floor", function()
  local hero = Player.new("hero", 20, { x = 0, y = 0, z = 1 })
  hero:move(1, 1)
  assert(hero.z == 1)
end)

check("floors at zero", function()
  local hero = Player.new("hero", 5, { x = 0, y = 0, z = 1 })
  assert(hero:damage(9) == 0)
end)
