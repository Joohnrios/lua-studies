local function subject(message)
  return string.match(message, "^(.-)\n")
end

local function has_blank_line(message)
  return string.find(message, "\n\n", 1, true) ~= nil
end

local sample = [[
Add the battle log.

Join the lines once, after the list exists.
]]

print(subject(sample))
print(has_blank_line(sample))

local function belongs(path)
  if path == ".env" then
    return false
  end
  if string.sub(path, 1, 11) == "playground/" then
    return false
  end
  return true
end

print(belongs(".env"))
print(belongs("playground/notes.lua"))
print(belongs("lessons/28-performance/exercises/performance.lua"))
