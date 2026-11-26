package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local World = require("world")
local Battle = require("battle")
local Encounter = require("encounter")
local Experience = require("experience")
local Reward = require("reward")
local Spoils = require("spoils")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local hero = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
local foe = { hp = 6, x = 1, y = 1, z = 7 }
local world = World.new(hero, foe)
local battle = Battle.new(6)
local encounter = Encounter.new(world, battle)
local progress = Experience.new()
local reward = Reward.new(progress, 10)
local spoils = Spoils.new(encounter, reward)

print(spoils:collect(foe))
print(foe.hp)
print(progress.xp)

foe.z = 6
foe.hp = 6

print(spoils:collect(foe))
print(foe.hp)

check("pays a faint", function()
  local mover = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local target = { hp = 6, x = 1, y = 1, z = 7 }
  local place = World.new(mover, target)
  local hit = Battle.new(6)
  local fight = Encounter.new(place, hit)
  local track = Experience.new()
  local prize = Reward.new(track, 10)
  local drop = Spoils.new(fight, prize)
  assert(drop:collect(target) == 2)
  assert(target.hp == 0)
end)
