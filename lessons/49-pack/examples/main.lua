package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Item = require("item")
local Inventory = require("inventory")
local Pack = require("pack")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local hero = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
hero:damage(12)

local potion = Item.new("potion", "healing", 5)
local bag = Inventory.new()
bag:add({ name = "potion", count = 2 })

local pack = Pack.new(bag, potion)

print(pack:drink(hero))
print(bag:count("potion"))
print(pack:drink(hero))
print(pack:drink(hero))
print(#bag.slots)

check("refuses an empty bag", function()
  local target = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local medicine = Item.new("potion", "healing", 5)
  local empty = Inventory.new()
  local dose = Pack.new(empty, medicine)
  assert(dose:drink(target) == 20)
  assert(target.hp == 20)
end)
