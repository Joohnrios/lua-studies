package.path = "./lessons/34-experience/examples/?.lua;" .. package.path

local Experience = require("experience")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local progress = Experience.new()

print(progress.level)
print(progress:gain(10))
print(progress.xp)
print(progress:gain(25))
print(progress.xp)
print(progress:gain(0))

check("crosses two costs", function()
  local fresh = Experience.new()
  assert(fresh:gain(30) == 3)
  assert(fresh.xp == 0)
end)
