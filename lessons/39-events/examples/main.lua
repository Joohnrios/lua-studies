package.path = "./lessons/39-events/examples/?.lua;" .. package.path

local Events = require("events")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

local events = Events.new()

print(events:emit("login"))
print(events:emit("faint"))
print(events:count("login"))
print(events:count("faint"))
print(events:emit("login"))
print(events:count("login"))
print(events:count("trade"))

check("counts one name", function()
  local board = Events.new()
  board:emit("spawn")
  board:emit("spawn")
  board:emit("despawn")
  assert(board:count("spawn") == 2)
end)
