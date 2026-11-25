package.path = "./lessons/21-responsibilities/examples/?.lua;" .. package.path

local health = require("health")
local notice = require("notice")
local creature = { name = "pika", hp = 30 }
local result = health.apply(creature, 10)

print(notice.line(creature.name, result))

result = health.apply(creature, 100)

print(notice.line(creature.name, result))
print(result.hp)
