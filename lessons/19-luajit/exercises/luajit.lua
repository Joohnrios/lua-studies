-- Exercise 19 — LuaJIT
-- Write each prediction before running this file.
-- Run it with luajit, not with lua.
--
--   luajit lessons/19-luajit/exercises/luajit.lua

-- Part A
-- predicted version: Lua 5.1
-- predicted unpack: nil
-- predicted environment: function
-- predicted bits: 2
-- predicted first: 1

print(_VERSION)
print(type(table.unpack))
print(type(setfenv))
print(bit.band(6, 3))

local found = {}

for i = 1, 2 do
  found[i] = function()
    return i
  end
end

print(found[1]())

-- Part B
-- Implement join(list).
-- Return every value of the sequence with the global unpack.
-- Do not create a global.

local function join(list)
  return unpack(list)
end

-- Part C
-- Implement bits(a, b).
-- Return the bitwise and of a and b.
-- Do not create a global.

local function bits(a, b)
  return bit.band(a, b)
end

print(join({ "potion", 4 }))
print(bits(6, 3))
