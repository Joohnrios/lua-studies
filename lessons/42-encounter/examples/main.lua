package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local World = require("world")
local Battle = require("battle")
local Encounter = require("encounter")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local hero = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
local foe = { hp = 10, x = 1, y = 1, z = 7 }
local world = World.new(hero, foe)
local battle = Battle.new(6)
local encounter = Encounter.new(world, battle)

print(encounter:act(foe))
print(foe.hp)

foe.z = 6

print(encounter:act(foe))
print(#world.log)

check("floors at zero", function()
  local mover = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local target = { hp = 3, x = 1, y = 1, z = 7 }
  local place = World.new(mover, target)
  local hit = Battle.new(9)
  local fight = Encounter.new(place, hit)
  assert(fight:act(target) == 0)
end)
