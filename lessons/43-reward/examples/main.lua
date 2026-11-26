package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Experience = require("experience")
local Reward = require("reward")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local progress = Experience.new()
local reward = Reward.new(progress, 10)
local foe = { hp = 4 }

print(reward:grant(foe))

foe.hp = 0

print(reward:grant(foe))
print(progress.xp)
print(reward:grant(foe))
print(progress.xp)

check("pays the first cost", function()
  local track = Experience.new()
  local prize = Reward.new(track, 10)
  local target = { hp = 0 }
  assert(prize:grant(target) == 2)
  assert(track.xp == 0)
end)
