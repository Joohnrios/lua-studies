package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")

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

print(watch:share())
print(foe:alive())

foe:damage(10)

print(foe:alive())

hero:move(1, 0)

print(watch:share())

check("shares one floor", function()
  local mover = Player.new("ash", 20, { x = 2, y = 2, z = 7 })
  local other = Creature.new("pika", "mouse", 10, { x = 2, y = 2, z = 6 })
  local eyes = Watch.new(mover, other)
  assert(eyes:share() == "apart")
end)
