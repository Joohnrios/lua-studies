package.path = "./projects/lua-rpg-core/?.lua;" .. package.path

local Player = require("player")
local Creature = require("creature")
local Watch = require("watch")
local Battle = require("battle")
local Strike = require("strike")
local Events = require("events")
local Mark = require("mark")
local Round = require("round")
local Verdict = require("verdict")

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
local events = Events.new()
local mark = Mark.new(strike, events)
local round = Round.new(mark, foe, 5)
local verdict = Verdict.new(round)

print(verdict:judge())
print(foe.hp)
print(events:count("hit"))

check("stands apart", function()
  local mover = Player.new("ash", 20, { x = 1, y = 1, z = 7 })
  local other = Creature.new("pika", "mouse", 10, { x = 4, y = 1, z = 7 })
  local eyes = Watch.new(mover, other)
  local hit = Battle.new(4)
  local blow = Strike.new(eyes, hit)
  local board = Events.new()
  local note = Mark.new(blow, board)
  local bout = Round.new(note, other, 2)
  local word = Verdict.new(bout)
  assert(word:judge() == "stand")
  assert(other.hp == 10)
end)
