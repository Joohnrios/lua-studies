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
local Dialogue = require("dialogue")
local Brief = require("brief")
local Events = require("events")
local Ledger = require("ledger")

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
local quest = Quest.new("hunt", 1)
local hunt = Hunt.new(spoils, quest)
local talk = Dialogue.new("guide", { "bring one", "bring two" })
local brief = Brief.new(talk, hunt)
local events = Events.new()
local ledger = Ledger.new(brief, events)

print(ledger:hear())
print(events:count("bring one"))
print(events:last())

quest:advance(1)

print(ledger:hear())
print(#events.log)

check("records the closing line", function()
  local mover = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local target = { hp = 3, x = 1, y = 1, z = 7 }
  local place = World.new(mover, target)
  local hit = Battle.new(3)
  local fight = Encounter.new(place, hit)
  local track = Experience.new()
  local prize = Reward.new(track, 10)
  local drop = Spoils.new(fight, prize)
  local task = Quest.new("hunt", 1)
  task:advance(1)
  local round = Hunt.new(drop, task)
  local speech = Dialogue.new("guide", { "bring one" })
  local intro = Brief.new(speech, round)
  local board = Events.new()
  local book = Ledger.new(intro, board)
  assert(book:hear() == "guide is done")
  assert(board:count("guide is done") == 1)
end)
