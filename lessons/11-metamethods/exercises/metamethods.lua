-- Exercise 11 — Metamethods
-- Write each prediction before running this file.
--
--   lua lessons/11-metamethods/exercises/metamethods.lua

-- Part A
-- predicted rawget(player, "name"): nil
-- predicted journal.name: ash
-- predicted player.level after the second assignment: 2

local journal = {}
local player = { level = 1 }

setmetatable(player, {
  __newindex = function(_, key, value)
    journal[key] = value
  end,
})

player.name = "ash"
player.level = 2

print(rawget(player, "name"))
print(journal.name)
print(player.level)

-- Part B
-- Implement coin(amount) so two coins can be added.
-- (coin(10) + coin(5)).amount is 15.
-- tostring(coin(10)) is "10c".
-- Do not create a global.

local coin_mt = {}

function coin_mt.__add(left, right)
  return setmetatable({ amount = left.amount + right.amount }, coin_mt)
end

function coin_mt.__tostring(value)
  return value.amount .. "c"
end

function coin_mt.__eq(left, right)
  return left.amount == right.amount
end

local function coin(amount)
  return setmetatable({ amount = amount }, coin_mt)
end

-- Part C
-- Two coins with the same amount compare equal with ==.
-- coin(10) == coin(10) is true.
-- coin(10) == coin(4) is false.
-- Do not create a global.

print(tostring(coin(10)))
print((coin(10) + coin(5)).amount)
print(coin(10) == coin(10))
print(coin(10) == coin(4))
