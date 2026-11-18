-- Exercise 3 — Operators and conditionals
-- Write each prediction before running this file.
--
--   lua lessons/03-operators-and-conditionals/exercises/conditionals.lua

-- Part A
-- predicted 7 / 2: 3.5
-- predicted 7 // 2: 3
-- predicted 8 % 3: 2
-- predicted not "": false
-- predicted ("ko" and 0 or "fainted"): 0
-- predicted (nil and 10 or 1): 1

print(7 / 2)
print(7 // 2)
print(8 % 3)
print(not "")
print("ko" and 0 or "fainted")
print(nil and 10 or 1)

-- Part B
-- Implement health_state(hp).
-- hp <= 0      -> "fainted"
-- hp < 30      -> "critical"
-- otherwise    -> "healthy"
-- Use if, elseif, and else. Do not create a global.

local function health_state(hp)
    if hp <= 0 then
        return "fainted"
    elseif hp < 30 then
        return "critical"
    else
        return "healthy"
    end
end

print(health_state(0))   -- fainted
print(health_state(15))  -- critical
print(health_state(50))  -- healthy

-- Part C
-- This line is meant to keep title when it already has a value,
-- and use "wild" only when title is missing.
-- It fails when title is false. Explain why in a comment.
-- Replace it with an if that preserves false.

local title = false

if title == nil then
    title = "wild"
end

print(title) -- false
