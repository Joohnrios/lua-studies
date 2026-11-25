-- Exercise 21 — Separation of responsibilities
-- Write each prediction before running this file from the repository root.
--
--   lua lessons/21-responsibilities/exercises/main.lua

package.path = package.path .. ";./lessons/21-responsibilities/exercises/?.lua"

-- Part A
-- predicted line: ash tired
-- predicted stamina: 7
-- predicted state: tired

local stamina = require("stamina")
local banner = require("banner")
local actor = { name = "ash", stamina = 12 }
local spent = stamina.spend(actor, 5)

print(banner.line(actor.name, spent))
print(spent.stamina)
print(spent.state)

-- Part B
-- In trade.lua, return a table with buy(player, price).
-- When player.coins is at least price, subtract price and return
-- { coins = remaining, state = "paid" }.
-- Otherwise leave the coins unchanged and return
-- { coins = player.coins, state = "short" }.
-- Do not build a sentence in this module.

-- Part C
-- In slip.lua, return a table with text(name, result).
-- Return name, a space, result.state, a space, and result.coins.
-- Do not change the player's coins in this module.

local trade = require("trade")
local slip = require("slip")
local player = { name = "joy", coins = 20 }
local bought = trade.buy(player, 5)

print(slip.text(player.name, bought))

local refused = trade.buy(player, 100)

print(slip.text(player.name, refused))
print(player.coins)
