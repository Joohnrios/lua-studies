package.path = "./lessons/32-item/examples/?.lua;" .. package.path

local Item = require("item")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local potion = Item.new("potion", "healing", 20)
local creature = { hp = 10, max_hp = 40 }

print(potion.name)
print(potion:apply(creature))

creature.hp = 30
print(potion:apply(creature))

local stone = Item.new("stone", "held", 0)

print(stone:apply(creature))

check("caps at the maximum", function()
  local target = { hp = 35, max_hp = 40 }
  local medicine = Item.new("potion", "healing", 20)
  assert(medicine:apply(target) == 40)
end)
