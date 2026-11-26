-- Exercise 28 — Performance
-- Write each prediction before running this file.
--
--   lua lessons/28-performance/exercises/performance.lua

local sample = { "ash", "ready" }

print(table.concat(sample, " "))

local function joined(count)
  local parts = {}
  for index = 1, count do
    parts[index] = tostring(index)
  end
  return table.concat(parts, ",")
end

local function repeated(count)
  local text = ""
  for index = 1, count do
    if index > 1 then
      text = text .. ","
    end
    text = text .. index
  end
  return text
end

-- Part A
-- predicted line: ash ready
-- predicted same: true
-- predicted joined: 1,2,3

print(joined(3) == repeated(3))
print(joined(3))

-- Part B
-- Implement join_lines(lines).
-- Return one string with the lines separated by a newline.
-- Use table.concat.
-- Do not create a global.

local function join_lines(lines)
  return table.concat(lines, "\n")
end

-- Part C
-- Implement battle_log(events).
-- Each event has name and hp.
-- Build one line per event, "name hp", then join those lines with newlines.
-- Use table.concat for the final join.
-- Do not create a global.

local function battle_log(events)
  local lines = {}
  for index = 1, #events do
    local event = events[index]
    lines[index] = event.name .. " " .. event.hp
  end
  return table.concat(lines, "\n")
end

print(join_lines({ "a", "b" }))
print(battle_log({
  { name = "pika", hp = 10 },
  { name = "pika", hp = 0 },
}))
