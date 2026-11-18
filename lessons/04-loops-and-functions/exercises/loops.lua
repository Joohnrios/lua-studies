-- Exercise 4 — Loops and functions
-- Write each prediction before running this file.
--
--   lua lessons/04-loops-and-functions/exercises/loops.lua

-- Part A
-- predicted for values: 2, 3, 4
-- predicted repeat values: 1, 2
-- predicted x: 4

for i = 2, 4 do
  print(i)
end

local n = 0

repeat
  n = n + 1
  print(n)
until n == 2

local function coords()
  return 4, 9
end

local x = coords()
print(x)

-- Part B
-- Implement sum_to(limit).
-- Return the sum 1 + 2 + ... + limit using a numeric for.
-- sum_to(0) returns 0. Do not create a global.

local function sum_to(limit)
  local total = 0

  for i = 1, limit do
      total = total + i
  end

  return total
end

print(sum_to(4)) -- 10
print(sum_to(5)) -- 15
print(sum_to(0)) -- 0

-- Part C
-- Implement damage_report(hp, damage).
-- Return two values: the remaining hp, never below 0,
-- and true when that remaining hp is 0.
-- Do not create a global.

local function damage_report(hp, damage)
  local remaining_hp = hp - damage

  if remaining_hp < 0 then
      remaining_hp = 0
  end

  local fainted = remaining_hp == 0

  return remaining_hp, fainted
end

local left, fainted = damage_report(10, 4)
print(left, fainted) -- 6 false

left, fainted = damage_report(10, 25)
print(left, fainted) -- 0 true
