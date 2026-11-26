-- Exercise 38 — NPC dialogue
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/38-npc-dialogue/exercises/main.lua

package.path = package.path .. ";./lessons/38-npc-dialogue/exercises/?.lua"

local Dialogue = require("dialogue")

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted first: hello
-- predicted second: follow me
-- predicted last: good luck
-- predicted closed: guide is done

local guide = Dialogue.new("guide", { "hello", "follow me", "good luck" })

print(guide:next())
print(guide:next())
print(guide:next())
print(guide:next())

-- Part B
-- In dialogue.lua, implement Dialogue:finished().
-- Return true when the current step has no line.
-- Return false while a line is still waiting.
-- Do not create a global.

-- Part C
-- Implement test_dialogue().
-- Run two checks named "still has a line" and "ends the talk".
-- Use check and assert.
-- "still has a line" calls next once on two lines and expects false.
-- "ends the talk" calls next twice on two lines and expects true.
-- Do not create a global.

local function test_dialogue()
  check("still has a line", function()
    local talk = Dialogue.new("guide", { "hello", "bye" })
    talk:next()
    assert(talk:finished() == false)
  end)

  check("ends the talk", function()
    local talk = Dialogue.new("guide", { "hello", "bye" })
    talk:next()
    talk:next()
    assert(talk:finished() == true)
  end)
end

test_dialogue()
