-- Exercise 20 — Modular architecture
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/20-architecture/exercises/main.lua

package.path = package.path .. ";./lessons/20-architecture/exercises/?.lua"

-- Part A
-- predicted line: ash 3,1
-- predicted distance: 3
-- predicted private: nil

local walk = require("walk")
local point = require("point")

print(walk.line({ name = "ash", x = 1, y = 1 }, 2, 0))
print(point.distance({ x = 1, y = 1 }, { x = 4, y = 1 }))
print(point.gap)

-- Part B
-- In steps.lua, return a table with gain(player, amount).
-- Add amount to player.steps and return the new total.
-- A negative amount leaves the total unchanged.
-- Keep that check in a local function. It must not be visible
-- outside the module.

-- Part C
-- In log.lua, require steps.
-- record(player, amount) returns player.name, a space, and the total
-- from steps.gain.
-- log.lua must not compute the total by itself.

local log = require("log")
local player = { name = "pika", steps = 10 }

print(log.record(player, 5))
print(log.record(player, -1))
print(require("steps").reject)
