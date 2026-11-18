-- Exercise 5 — Tables
-- Write each prediction before running this file.
--
--   lua lessons/05-tables/exercises/tables.lua

-- Part A
-- predicted items[1]: "ball"
-- predicted items[3]: "berry   "
-- predicted #items: 3
-- predicted items[4]: nil
-- predicted pokemon.species: "bulbasaur"
-- predicted pokemon["level"] before the assignment: 5
-- predicted pokemon.level after the assignment: nil

local items = { "ball", "potion", "berry" }

print(items[1])
print(items[3])
print(#items)
print(items[4])

local pokemon = { species = "bulbasaur", level = 5 }

print(pokemon.species)
print(pokemon["level"])

pokemon.level = nil
print(pokemon.level)

-- Part B
-- Implement add_item(bag, item).
-- Append item to the sequence and return the new length.
-- An empty bag must work. Do not create a global.
-- Keep the sequence without holes.

local function add_item(bag, item)
    local next_index = #bag + 1

    bag[next_index] = item

    return #bag
end

local bag = {}

print(add_item(bag, "potion")) -- 1
print(add_item(bag, "ball"))   -- 2
print(add_item(bag, "berry"))  -- 3

-- Part C
-- Implement grant_xp(creature, amount).
-- Missing xp means 0. Store the sum in the same table and return it.
-- Do not create a global.

local function grant_xp(creature, amount)
    local current_xp = creature.xp or 0

    creature.xp = current_xp + amount

    return creature.xp
end

print(add_item({}, "potion"))

local creature = { species = "bulbasaur" }
print(grant_xp(creature, 10))
print(grant_xp(creature, 5))
print(creature.xp)
