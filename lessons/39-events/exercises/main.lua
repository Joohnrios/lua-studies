-- Exercise 39 — Events
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/39-events/exercises/main.lua

package.path = package.path .. ";./lessons/39-events/exercises/?.lua"

local Events = require("events")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted first: 1
-- predicted second: 2
-- predicted dawn: 1
-- predicted third: 3
-- predicted repeated: 2
-- predicted missing: 0

local events = Events.new()

print(events:emit("dawn"))
print(events:emit("battle"))
print(events:count("dawn"))
print(events:emit("dawn"))
print(events:count("dawn"))
print(events:count("rain"))

-- Part B
-- In events.lua, implement Events:last().
-- Return the name stored at the end of the log.
-- An empty log returns nil.
-- Do not create a global.

-- Part C
-- Implement test_events().
-- Run two checks named "reads the latest" and "starts empty".
-- Use check and assert.
-- "reads the latest" emits "login" and then "faint", and expects last "faint".
-- "starts empty" expects last nil.
-- Do not create a global.

local function test_events()
  check("reads the latest", function()
    local board = Events.new()
    board:emit("login")
    board:emit("faint")
    assert(board:last() == "faint")
  end)

  check("starts empty", function()
    local board = Events.new()
    assert(board:last() == nil)
  end)
end

test_events()
