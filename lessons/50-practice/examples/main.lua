package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Item = require("item")
local Inventory = require("inventory")
local Pack = require("pack")
local Skill = require("skill")
local Practice = require("practice")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local hero = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
hero:damage(10)

local potion = Item.new("potion", "healing", 4)
local bag = Inventory.new()
bag:add({ name = "potion", count = 1 })

local pack = Pack.new(bag, potion)
local skill = Skill.new("medicine")
local practice = Practice.new(pack, skill)

print(practice:sip(hero))
print(skill.rank)
print(skill.uses)

bag:add({ name = "potion", count = 4 })
practice:sip(hero)
practice:sip(hero)
practice:sip(hero)
practice:sip(hero)

print(skill.rank)
print(skill.uses)

check("skips an empty sip", function()
  local target = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local medicine = Item.new("potion", "healing", 4)
  local empty = Inventory.new()
  local dose = Pack.new(empty, medicine)
  local trade = Skill.new("medicine")
  local drill = Practice.new(dose, trade)
  assert(drill:sip(target) == 20)
  assert(trade.uses == 0)
end)
