package.path = "./lessons/37-quest/examples/?.lua;" .. package.path

local Quest = require("quest")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local quest = Quest.new("berries", 5)

print(quest:advance(2))
print(quest:done())
print(quest:advance(3))
print(quest:done())
print(quest:advance(4))
print(quest:advance(0))

check("caps at the goal", function()
  local shells = Quest.new("shells", 4)
  assert(shells:advance(9) == 4)
  assert(shells:done() == true)
end)
