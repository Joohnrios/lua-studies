-- Exercise 13 — Coroutines
-- Write each prediction before running this file.
--
--   lua lessons/13-coroutines/exercises/coroutines.lua

-- Part A
-- predicted first resume: true, ready
-- predicted status after the first resume: suspended
-- predicted second resume: true, done
-- predicted status after the second resume: dead

local co = coroutine.create(function()
  coroutine.yield("ready")
  return "done"
end)

print(coroutine.resume(co))
print(coroutine.status(co))
print(coroutine.resume(co))
print(coroutine.status(co))

-- Part B
-- Implement script(lines).
-- It returns a function. Each call returns the next line.
-- After the last line, the next call returns nil.
-- Do not create a global.

local function script(lines)
  local co = coroutine.create(function()
    for index = 1, #lines do
      coroutine.yield(lines[index])
    end
  end)

  return function()
    local ok, value = coroutine.resume(co)
    if not ok then
      return nil
    end
    return value
  end
end

-- Part C
-- Implement blows(hp, damage) as a coroutine.
-- Each resume subtracts damage from hp, never below 0, and yields the remaining hp.
-- blows(10, 4) yields 6, then 2, then 0.
-- Do not create a global.

local function blows(hp, damage)
  return coroutine.create(function()
    while hp > 0 do
      hp = hp - damage
      if hp < 0 then
        hp = 0
      end
      coroutine.yield(hp)
    end
  end)
end

local next_line = script({ "hello", "trainer" })

print(next_line())
print(next_line())
print(next_line())

local battle = blows(10, 4)

print(coroutine.resume(battle))
print(coroutine.resume(battle))
print(coroutine.resume(battle))
