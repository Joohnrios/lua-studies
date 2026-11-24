local defaults = { hp = 10 }
local creature = { name = "pika" }

setmetatable(creature, { __index = defaults })

print(creature.name)
print(creature.hp)
print(rawget(creature, "hp"))

creature.hp = 20

print(creature.hp)
print(defaults.hp)

local methods = {}

function methods:label()
  return self.name
end

setmetatable(creature, { __index = methods })
print(creature:label())

local flags = { flag = false }

setmetatable(flags, { __index = { flag = true } })
print(flags.flag)

flags.flag = nil
print(flags.flag)
