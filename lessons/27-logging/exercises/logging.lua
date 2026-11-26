-- Exercise 27 — Logging
-- Write each prediction before running this file.
--
--   lua lessons/27-logging/exercises/logging.lua

local ranks = {
  debug = 1,
  info = 2,
  warn = 3,
  error = 4,
}

local function preview(minimum)
  local threshold = ranks[minimum]

  return function(level, message)
    if ranks[level] < threshold then
      return nil
    end
    return level .. " " .. message
  end
end

-- Part A
-- predicted info: nil
-- predicted warn: warn low
-- predicted error: error down

local preview_log = preview("warn")

print(preview_log("info", "ready"))
print(preview_log("warn", "low"))
print(preview_log("error", "down"))

-- Part B
-- Implement make_log(minimum).
-- Return a function(level, message).
-- Drop a level below minimum and return nil.
-- Otherwise return level, a space, and message.
-- Use the ranks table above.
-- Do not create a global.

local function make_log(minimum)
  local threshold = ranks[minimum]

  return function(level, message)
    if ranks[level] < threshold then
      return nil
    end
    return level .. " " .. message
  end
end

-- Part C
-- Implement record(log, creature, amount).
-- Subtract amount from creature.hp and never let hp go below 0.
-- When hp reaches 0, return log("error", creature.name .. " fainted").
-- Otherwise return log("info", creature.name .. " " .. creature.hp).
-- Do not create a global.

local function record(log, creature, amount)
  creature.hp = creature.hp - amount
  if creature.hp < 0 then
    creature.hp = 0
  end
  if creature.hp == 0 then
    return log("error", creature.name .. " fainted")
  end
  return log("info", creature.name .. " " .. creature.hp)
end

local log = make_log("info")
local creature = { name = "pika", hp = 12 }

print(record(log, creature, 2))
print(record(log, creature, 20))
print(creature.hp)
