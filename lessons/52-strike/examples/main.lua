package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")
local Battle = require("battle")
local Strike = require("strike")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local hero = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
local foe = Creature.new("pika", "mouse", 10, { x = 1, y = 1, z = 7 })
local watch = Watch.new(hero, foe)
local battle = Battle.new(4)
local strike = Strike.new(watch, battle)

print(strike:hit())
print(foe.hp)
print(strike:hit())

hero:move(1, 0)

print(strike:hit())

check("floors a neighbor", function()
  local mover = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local other = Creature.new("pika", "mouse", 3, { x = 1, y = 1, z = 7 })
  local eyes = Watch.new(mover, other)
  local hit = Battle.new(9)
  local blow = Strike.new(eyes, hit)
  assert(blow:hit() == 0)
end)
