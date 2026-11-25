-- Exercise 25 — Unit tests
-- Write each prediction before running this file.
--
--   lua lessons/25-tests/exercises/tests.lua

local function damage(hp, amount)
  local next_hp = hp - amount
  if next_hp < 0 then
    next_hp = 0
  end
  return next_hp
end

local function check(name, test)
  local ok = pcall(test)
  if ok then
    print("pass " .. name)
    return
  end
  print("fail " .. name)
end

-- Part A
-- predicted first: pass keeps a remainder
-- predicted second: fail rejects a negative result

check("keeps a remainder", function()
  assert(damage(8, 3) == 5)
end)

check("rejects a negative result", function()
  assert(damage(2, 9) == 2)
end)

-- Part B
-- Implement heal(hp, max_hp, amount).
-- Add amount to hp.
-- Never return a value above max_hp.
-- A negative amount leaves hp unchanged.
-- Do not create a global.

local function heal(hp, max_hp, amount)
  if amount < 0 then
    return hp
  end
  local next_hp = hp + amount
  if next_hp > max_hp then
    return max_hp
  end
  return next_hp
end

-- Part C
-- Implement test_heal().
-- Run three checks named "adds", "caps", and "ignores a negative".
-- Use check and assert.
-- "adds" starts at 10, heals 5, and expects 15, with a max of 40.
-- "caps" starts at 18, heals 5, and expects 20, with a max of 20.
-- "ignores a negative" starts at 12, heals -3, and expects 12, with a max of 20.
-- Do not create a global.

local function test_heal()
  check("adds", function()
    assert(heal(10, 40, 5) == 15)
  end)
  check("caps", function()
    assert(heal(18, 20, 5) == 20)
  end)
  check("ignores a negative", function()
    assert(heal(12, 20, -3) == 12)
  end)
end

test_heal()
