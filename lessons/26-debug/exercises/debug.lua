-- Exercise 26 — Debugging
-- Write each prediction before running this file.
--
--   lua lessons/26-debug/exercises/debug.lua

-- Part A
-- predicted name: ping
-- predicted direct: named
-- predicted tail: nil

local function ping()
  return debug.getinfo(1, "n").name
end

local function direct()
  return debug.getinfo(2, "n").name
end

local function named()
  local value = direct()
  return value
end

local function tail()
  return direct()
end

print(ping())
print(named())
print(tail())

-- Part B
-- Implement trace(fn).
-- Call fn with xpcall.
-- On success, return true and the result.
-- On failure, return false and debug.traceback of the error, starting at level 2.
-- Do not create a global.

local function trace(fn)
  return xpcall(fn, function(message)
    return debug.traceback(message, 2)
  end)
end

-- Part C
-- Implement caller_name().
-- Return the name at stack level 2.
-- Do not create a global.

local function caller_name()
  return debug.getinfo(2, "n").name
end

local function guarded()
  error("missing")
end

local failed, result = trace(guarded)

print(failed)
print(string.find(result, "missing", 1, true) ~= nil)

local function show()
  local name = caller_name()
  print(name)
end

show()
