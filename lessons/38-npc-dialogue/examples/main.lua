package.path = "./lessons/38-npc-dialogue/examples/?.lua;" .. package.path

local Dialogue = require("dialogue")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local nurse = Dialogue.new("nurse", { "welcome", "rest here" })

print(nurse:next())
print(nurse:next())
print(nurse:next())
print(nurse:next())

check("stops after the last line", function()
  local talk = Dialogue.new("nurse", { "welcome" })
  talk:next()
  assert(talk:next() == "nurse is done")
end)
