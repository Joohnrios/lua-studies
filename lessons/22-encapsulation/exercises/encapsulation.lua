-- Exercise 22 — Encapsulation
-- Write each prediction before running this file.
--
--   lua lessons/22-encapsulation/exercises/encapsulation.lua

-- Part A
-- predicted taken: 5
-- predicted field: nil
-- predicted left: 5

local function jar(initial)
  local seeds = initial
  local self = {}

  function self.take(amount)
    if amount > seeds then
      return seeds
    end
    seeds = seeds - amount
    return seeds
  end

  return self
end

local box = jar(8)

print(box.take(3))
print(box.seeds)
print(box.take(10))

-- Part B
-- Implement hp_bar(initial).
-- Return a table with damage(amount) and current().
-- damage subtracts amount and never lets the hidden hp go below 0.
-- damage and current return the hidden hp.
-- Do not store hp as a field of the returned table.
-- Do not create a global.

local function hp_bar(initial)
  local hp = initial
  local self = {}

  function self.damage(amount)
    hp = hp - amount
    if hp < 0 then
      hp = 0
    end
    return hp
  end

  function self.current()
    return hp
  end

  return self
end

-- Part C
-- Implement nameplate(name).
-- Return a table with rename(next) and label().
-- rename replaces the hidden name when next is a non-empty string.
-- An empty string leaves the hidden name unchanged.
-- Both functions return the hidden name.
-- Do not store the name as a field of the returned table.
-- Do not create a global.

local function nameplate(name)
  local hidden = name
  local self = {}

  function self.rename(next)
    if type(next) == "string" and next ~= "" then
      hidden = next
    end
    return hidden
  end

  function self.label()
    return hidden
  end

  return self
end

local bar = hp_bar(30)

print(bar.damage(10))
print(bar.current())
print(bar.hp)
print(bar.damage(100))

local plate = nameplate("pika")

print(plate.rename(""))
print(plate.label())
print(plate.rename("raichu"))
print(plate.name)
