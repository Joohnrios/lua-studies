-- Exercise 10 — Metatables
-- Write each prediction before running this file.
--
--   lua lessons/10-metatables/exercises/metatables.lua

-- Part A
-- predicted pokemon.role: creature
-- predicted rawget(pokemon, "role"): nil
-- predicted shared.role after the assignment: creature

local shared = { role = "creature" }
local pokemon = { name = "bulbasaur" }

setmetatable(pokemon, { __index = shared })

print(pokemon.role)
print(rawget(pokemon, "role"))

pokemon.role = "starter"

print(shared.role)

-- Part B
-- Give every creature an alive method without copying the function into each one.
-- alive returns true when self.hp is greater than 0.
-- Attach the methods table through __index.
-- Do not create a global.

local methods = {}

function methods:alive()
  return self.hp > 0
end

local function creature(name, hp)
  local value = { name = name, hp = hp }
  setmetatable(value, { __index = methods })
  return value
end

-- Part C
-- missing_xp reads record.xp.
-- When the key is absent, an __index function returns 0.
-- A stored xp must be returned as it is, including 0.
-- Do not create a global.

local function missing_xp(record)
  setmetatable(record, {
    __index = function(_, key)
      if key == "xp" then
        return 0
      end
    end,
  })

  return record.xp
end

local pikachu = creature("pikachu", 30)
local fainted = creature("pidgey", 0)

print(pikachu:alive())
print(fainted:alive())

local fresh = {}
local stored = { xp = 0 }

print(missing_xp(fresh))
print(missing_xp(stored))
