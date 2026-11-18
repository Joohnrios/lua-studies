-- Exercise 1 — Values and types
--
-- Part A. Before running anything, write your prediction in a comment for
-- each value below: what type() returns, and whether `if value then` enters.
--   nil, false, true, 0, 1.0, "", "false", {}, print
--
-- Part B. Confirm with code. Keep the original prediction next to the result.
--
-- Part C. Implement describe(value) so it prints the type of its argument.
-- Call it with nil, a boolean, a number, a string, a function, and a table.
--
-- Run:
--   lua lessons/01-syntax-and-types/exercises/types.lua

-- Exercise 1 — Values and types

-- Part A — Predictions
--
-- Value       type()       if value then
-- nil         nil          Does not enter
-- false       boolean      Does not enter
-- true        boolean      Enters
-- 0           number       Enters
-- 1.0         number       Enters
-- ""          string       Enters
-- "false"     string       Enters
-- {}          table        Enters
-- print       function     Enters

-- Part B — Confirmation

local values = {
    -- Reminder: `value = nil` removes the key. Nil is tested below, outside the table.
    -- { name = "nil", value = nil, expected_type = "nil", expected_if = false },
    { name = "false", value = false, expected_type = "boolean", expected_if = false },
    { name = "true", value = true, expected_type = "boolean", expected_if = true },
    { name = "0", value = 0, expected_type = "number", expected_if = true },
    { name = "1.0", value = 1.0, expected_type = "number", expected_if = true },
    { name = '""', value = "", expected_type = "string", expected_if = true },
    { name = '"false"', value = "false", expected_type = "string", expected_if = true },
    { name = "{}", value = {}, expected_type = "table", expected_if = true },
    { name = "print", value = print, expected_type = "function", expected_if = true }
}

for _, item in ipairs(values) do
    local actual_type = type(item.value)
    local actual_if = not not item.value

    print(string.format(
        "%-10s | type: %-8s | if: %-5s | Prediction: %s",
        item.name,
        actual_type,
        tostring(actual_if),
        actual_type == item.expected_type and actual_if == item.expected_if
            and "Correct"
            or "Incorrect"
    ))
end

-- Part C — Describe function

local function describe(value)
    print("Type: " .. type(value))
end

describe(nil) -- valid: nil is a normal value when it is not stored in a table
describe(true)
describe(42)
describe("Hello Lua")
describe(print)
describe({})

-- Test nil separately because tables cannot store nil values.

local nil_value = nil

print(string.format(
    "%-10s | type: %-8s | if: %s",
    "nil",
    type(nil_value),
    tostring(not not nil_value)
))
