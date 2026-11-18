-- Exercise 7 — Iterators
-- Write each prediction before running this file.
-- For pairs, predict the keys that appear. Do not predict their order.
--
--   lua lessons/07-iterators/exercises/iterators.lua

-- Part A
-- predicted ipairs lines: 1 "ball" 2 "potion"
-- predicted pairs keys: 1 "ball" 2 "potion" 4 "berry" owner "ash"

local slots = { "ball", "potion" }
slots[4] = "berry"
slots.owner = "ash"

for index, item in ipairs(slots) do
  print(index, item)
end

for key, value in pairs(slots) do
  print(key, value)
end

-- Part B
-- Implement sum_list(list).
-- Add every number visited by ipairs and return the total.
-- An empty list returns 0. Do not create a global.

local function sum_list(list)
  local total = 0

  for index, value in ipairs(list) do
      total = total + value
  end

  return total
end

print(sum_list({ 10, 20, 5 })) -- 35
print(sum_list({}))            -- 0

-- Part C
-- Implement countdown(start) as an iterator.
-- `for n in countdown(3)` must visit 3, then 2, then 1.
-- Do not build a table with those numbers.
-- Do not create a global.

local function countdown(start)
  local current = start + 1

  return function()
      current = current - 1

      if current > 0 then
          return current
      end
  end
end

print(sum_list({ 10, 20, 5 }))
print(sum_list({}))

for n in countdown(3) do
  print(n)
end
