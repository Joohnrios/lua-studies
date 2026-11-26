package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local World = require("world")
local Battle = require("battle")
local Encounter = require("encounter")
local Experience = require("experience")
local Reward = require("reward")
local Spoils = require("spoils")
local Quest = require("quest")
local Hunt = require("hunt")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local hero = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
local foe = { hp = 3, x = 1, y = 1, z = 7 }
local world = World.new(hero, foe)
local battle = Battle.new(3)
local encounter = Encounter.new(world, battle)
local progress = Experience.new()
local reward = Reward.new(progress, 10)
local spoils = Spoils.new(encounter, reward)
local quest = Quest.new("hunt", 2)
local hunt = Hunt.new(spoils, quest)

print(hunt:finish(foe))
print(quest.progress)

foe.hp = 3

print(hunt:finish(foe))
print(quest:done())

foe.z = 6
foe.hp = 3

print(hunt:finish(foe))
print(quest.progress)

check("counts one faint", function()
  local mover = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local target = { hp = 3, x = 1, y = 1, z = 7 }
  local place = World.new(mover, target)
  local hit = Battle.new(3)
  local fight = Encounter.new(place, hit)
  local track = Experience.new()
  local prize = Reward.new(track, 10)
  local drop = Spoils.new(fight, prize)
  local task = Quest.new("hunt", 1)
  local round = Hunt.new(drop, task)
  assert(round:finish(target) == 2)
  assert(task:done() == true)
end)
