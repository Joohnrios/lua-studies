package.path = "./lessons/35-combat/examples/?.lua;" .. package.path

local Combat = require("combat")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local blow = Combat.new(8)
local target = { hp = 20 }

print(blow:strike(target))
print(blow:strike(target))

local heavy = Combat.new(10)
print(heavy:strike(target))

local tap = Combat.new(0)
print(tap:strike(target))

check("floors at zero", function()
  local foe = { hp = 3 }
  local hit = Combat.new(9)
  assert(hit:strike(foe) == 0)
end)
