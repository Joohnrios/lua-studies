-- Exercise 9 — Modules and require
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/09-modules/exercises/main.lua

package.path = package.path .. ";./lessons/09-modules/exercises/?.lua"

-- Part A
-- predicted loads: 1
-- predicted same table (true or false): true
-- predicted counter.hidden: false

local counter = require("counter")
local again = require("counter")

print(counter.loads)
print(again == counter)
print(counter.hidden)
print(counter.hidden_result())

-- Part B
-- In health.lua, return a table with state(hp).
-- hp <= 0   -> "fainted"
-- hp < 30   -> "critical"
-- otherwise -> "healthy"

-- Part C
-- In the same module, damage(creature, amount) subtracts amount from creature.hp.
-- Never let hp go below 0. Return the remaining hp.
-- Keep the lower bound in a local function. That function must not be visible
-- outside the module.

local health = require("health")

print(health.state(0))
print(health.state(10))
print(health.state(40))

local creature = { hp = 30 }

print(health.damage(creature, 5))
print(health.damage(creature, 100))
print(health.limit)
