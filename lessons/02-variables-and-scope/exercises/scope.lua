-- Exercise 2 — Variables and scope
-- Write the prediction for each print before running this file.
--
--   lua lessons/02-variables-and-scope/exercises/scope.lua

-- Part A
hp = 10

local function heal()
  local hp = hp + 5
  return hp
end

-- predicted heal():
-- Predictions:
-- heal() returns 15
-- hp remains 10

print(heal())
print(hp)

-- Part B
local level = 1

if level == 1 then
  local level = 2
  local title = "beginner"
end

-- predicted level:
-- predicted title:
-- Predictions:
-- level = 1
-- title = nil
print(level)
print(title)

-- Part C
-- next_hit should return 1, then 2, then 3.
-- It always returns 1. Explain why in a comment and fix it.
-- Do not use a global.

-- The original function always returns 1 because
-- hits is initialized to 0 on every function call.
--
-- Fix: use a closure to preserve the counter.

local function create_hit_counter()
  local hits = 0

  return function()
      hits = hits + 1
      return hits
  end
end

local next_hit = create_hit_counter()

print(next_hit()) -- 1
print(next_hit()) -- 2
print(next_hit()) -- 3


