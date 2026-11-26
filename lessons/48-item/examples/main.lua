package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Item = require("item")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local hero = Player.new("ash", 10, { x = 1, y = 1, z = 7 })
hero:damage(6)

local potion = Item.new("potion", "healing", 3)
local stone = Item.new("stone", "held", 0)

print(potion:label())
print(potion:use(hero))
print(potion:use(hero))
print(stone:use(hero))

check("caps at the maximum", function()
  local target = Player.new("ash", 10, { x = 1, y = 1, z = 7 })
  target:damage(2)
  local medicine = Item.new("potion", "healing", 5)
  assert(medicine:use(target) == 10)
end)
