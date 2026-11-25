-- Exercise 24 — Strategy
-- Write each prediction before running this file.
--
--   lua lessons/24-strategy/exercises/strategy.lua

local function ember(actor, target)
  target.hp = target.hp - 2
  return target.hp
end

local function tackle(actor, target)
  target.hp = target.hp - actor.power
  return target.hp
end

local function battler(name, power, behavior)
  local attack = behavior
  local self = { name = name, power = power }

  function self.use(target)
    return attack(self, target)
  end

  function self.swap(next_behavior)
    attack = next_behavior
  end

  return self
end

-- Part A
-- predicted first: 10
-- predicted second: 5

local mon = battler("pika", 5, ember)
local dummy = { hp = 12 }

print(mon.use(dummy))
mon.swap(tackle)
print(mon.use(dummy))

-- Part B
-- Implement spark(actor, target) and wave(actor, target).
-- spark subtracts 6 from target.hp and returns the new hp.
-- wave subtracts actor.power * 2 from target.hp and returns the new hp.
-- Do not create a global.

local function spark(actor, target)
  target.hp = target.hp - 6
  return target.hp
end

local function wave(actor, target)
  target.hp = target.hp - actor.power * 2
  return target.hp
end

-- Part C
-- Implement mage(name, power, spell).
-- Return a table with cast(target) and equip(next_spell).
-- cast calls the current spell with the mage and the target.
-- equip replaces the spell.
-- Do not create a global.

local function mage(name, power, spell)
  local current = spell
  local self = { name = name, power = power }

  function self.cast(target)
    return current(self, target)
  end

  function self.equip(next_spell)
    current = next_spell
  end

  return self
end

local caster = mage("joy", 4, spark)
local target = { hp = 30 }

print(caster.cast(target))
caster.equip(wave)
print(caster.cast(target))
