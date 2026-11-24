-- Exercise 18 — Lua 5.1 and Lua 5.4
-- Write each prediction before running this file.
-- This file runs on Lua 5.4.
--
--   lua lessons/18-versions/exercises/versions.lua

-- Part A
-- predicted kind: float
-- predicted unpack: nil
-- predicted quotient: 2
-- predicted length: 0
-- predicted first: 1

print(math.type(9 / 3))
print(type(unpack))
print(8 // 3)

local box = setmetatable({ 4, 5, 6 }, {
  __len = function()
    return 0
  end,
})

print(#box)

local found = {}

for i = 1, 2 do
  found[i] = function()
    return i
  end
end

print(found[1]())

-- Part B
-- Implement spread(list).
-- Return every value of the sequence with table.unpack.
-- Do not create a global.

local function spread(list)
  return table.unpack(list)
end

-- Part C
-- Implement bounded(list, n).
-- Return list with a metatable whose __len returns n.
-- Do not create a global.

local function bounded(list, n)
  return setmetatable(list, {
    __len = function()
      return n
    end,
  })
end

print(spread({ "potion", 3 }))
print(#bounded({ 10, 20, 30 }, 2))
