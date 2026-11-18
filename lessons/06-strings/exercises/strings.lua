-- Exercise 6 — Strings
-- Write each prediction before running this file.
--
--   lua lessons/06-strings/exercises/strings.lua

-- Part A
-- predicted #item: 6
-- predicted string.sub(item, 2, 4): "oti"
-- predicted string.sub(item, -2): "on"
-- predicted concatenation: "potion x3"

local item = "potion"

print(#item)
print(string.sub(item, 2, 4))
print(string.sub(item, -2))
print(item .. " x" .. 3)

-- Part B
-- Implement format_creature(species, level).
-- Return a string like "Bulbasaur Lv5" using string.format.
-- Do not create a global.

local function format_creature(species, level)
    return string.format("%s Lv%d", species, level)
end

print(format_creature("Bulbasaur", 5))

-- Part C
-- Implement read_hp(text).
-- Read the digits from a text such as "hp: 30" and return them as a number.
-- Return nil when the text has no digits.
-- Do not create a global.

local function read_hp(text)
    local digits = string.match(text, "%d+")

    if digits == nil then
        return nil
    end

    return tonumber(digits)
end

print(format_creature("Bulbasaur", 5))
print(read_hp("hp: 30"))
print(read_hp("fainted"))
