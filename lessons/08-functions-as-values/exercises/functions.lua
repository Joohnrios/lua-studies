-- Exercise 8 — Functions as values
-- Write each prediction before running this file.
--
--   lua lessons/08-functions-as-values/exercises/functions.lua

-- Part A
-- predicted apply: "LUA"
-- predicted bag:add: 5

local function apply(fn, value)
  return fn(value)
end

print(apply(string.upper, "lua"))

local bag = { count = 2 }

function bag:add(amount)
  self.count = self.count + amount
  return self.count
end

print(bag:add(3))

-- Part B
-- Implement call_twice(fn, value).
-- Return the result of calling fn twice on value.
-- call_twice(function(n) return n + 1 end, 10) returns 12.
-- Do not create a global.

local function call_twice(fn, value)
  local first_result = fn(value)
  local second_result = fn(first_result)

  return second_result
end

-- Part C
-- Define creature:damage(amount) with the colon form.
-- Subtract amount from self.hp, never let hp go below 0, and return self.hp.
-- Do not create a global.

local creature = { name = "pikachu", hp = 30 }

function creature:damage(amount)
    self.hp = self.hp - amount

    if self.hp < 0 then
        self.hp = 0
    end

    return self.hp
end

print(call_twice(function(n)
    return n + 1
end, 10))

print(creature:damage(5))
print(creature:damage(100))
