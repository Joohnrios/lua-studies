package.path = "./lessons/36-skills/examples/?.lua;" .. package.path

local Skill = require("skill")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local fishing = Skill.new("fishing")

print(fishing.rank)
print(fishing:train(4))
print(fishing:train(1))
print(fishing:train(7))
print(fishing:train(0))

check("counts whole steps", function()
  local skill = Skill.new("fishing")
  assert(skill:train(12) == 3)
  assert(skill.uses == 12)
end)
