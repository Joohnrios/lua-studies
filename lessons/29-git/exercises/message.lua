-- Exercise 29 — Git practice
-- Write each prediction before running this file.
--
--   lua lessons/29-git/exercises/message.lua

local function subject(message)
  return string.match(message, "^(.-)\n")
end

local function has_blank_line(message)
  return string.find(message, "\n\n", 1, true) ~= nil
end

local sample = [[
Fix the heal floor.

A negative heal was raising hit points.
]]

-- Part A
-- predicted subject: Fix the heal floor.
-- predicted blank: true

print(subject(sample))
print(has_blank_line(sample))

-- Part B
-- Implement commit_message().
-- Return a message for this change: floor hit points at zero.
-- The first line is an English imperative.
-- The next line is blank.
-- The body says why the floor exists.
-- Do not create a global.

local function commit_message()
  return "Floor hit points at zero.\n\nA blow past zero would store a negative total.\n"
end

-- Part C
-- Implement belongs(path).
-- Return false for ".env" and for a path that starts with "playground/".
-- Return true for a lesson file.
-- Do not create a global.

local function belongs(path)
  if path == ".env" then
    return false
  end
  if string.sub(path, 1, 11) == "playground/" then
    return false
  end
  return true
end

print(subject(commit_message()))
print(has_blank_line(commit_message()))
print(belongs(".env"))
print(belongs("playground/notes.lua"))
print(belongs("lessons/29-git/exercises/message.lua"))
