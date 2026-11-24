-- Exercise 12 — Closures
-- Write each prediction before running this file.
--
--   lua lessons/12-closures/exercises/closures.lua

-- Part A
-- predicted first two hits: 1, then 2
-- predicted other: 1

local function hits()
  local total = 0

  return function()
    total = total + 1
    return total
  end
end

local first = hits()
local other = hits()

print(first())
print(first())
print(other())

-- Part B
-- Implement wallet(start).
-- It returns a function. Each call adds the argument to the hidden balance
-- and returns the new balance.
-- wallet(10) followed by add(5) and add(1) returns 15 and then 16.
-- Two wallets do not share a balance.
-- Do not create a global.

local function wallet(start)
  local balance = start

  return function(amount)
    balance = balance + amount
    return balance
  end
end

-- Part C
-- collect(limit) returns a list of functions.
-- The function at index n returns n.
-- collect(3)[1]() is 1, collect(3)[2]() is 2, collect(3)[3]() is 3.
-- Do not create a global.

local function collect(limit)
  local functions = {}

  for n = 1, limit do
    functions[n] = function()
      return n
    end
  end

  return functions
end

local add = wallet(10)

print(add(5))
print(add(1))

local another = wallet(0)

print(another(3))

local picked = collect(3)

print(picked[1]())
print(picked[2]())
print(picked[3]())
