-- Exercise 15 — Error handling
-- Write each prediction before running this file.
--
--   lua lessons/15-errors/exercises/errors.lua

-- Part A
-- predicted assert("ok"): ok
-- predicted pcall ok: false
-- predicted assert(0, "zero"): 0	zero

print(assert("ok"))

local ok, result = pcall(function()
  assert(false, "fainted")
  return "alive"
end)

print(ok)
print(type(result))
print(assert(0, "zero"))

-- Part B
-- Implement heal(creature, amount).
-- Raise an error when creature is nil or amount is negative.
-- Otherwise add amount to creature.hp and return the new hp.
-- Do not create a global.

local function heal(creature, amount)
  assert(creature ~= nil, "creature is missing")
  assert(amount ~= nil and amount >= 0, "amount is negative")
  creature.hp = creature.hp + amount
  return creature.hp
end

-- Part C
-- Implement try_heal(creature, amount).
-- Call heal in protected mode.
-- On success, return the new hp.
-- On failure, return nil and the error value.
-- Do not create a global.

local function try_heal(creature, amount)
  local ok, result = pcall(heal, creature, amount)
  if not ok then
    return nil, result
  end
  return result
end

local creature = { hp = 10 }

print(try_heal(creature, 5))

local hp, err = try_heal(creature, -1)

print(hp)
print(type(err))
print(try_heal(nil, 1))
