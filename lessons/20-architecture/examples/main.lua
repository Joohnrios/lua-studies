package.path = "./lessons/20-architecture/examples/?.lua;" .. package.path

local travel = require("travel")
local position = require("position")
local actor = { name = "pika", x = 10, y = 4, z = 7 }

print(travel.report(actor, 2, -1))
print(position.distance({ x = 0, y = 0, z = 7 }, { x = 3, y = 1, z = 7 }))
print(position.distance({ x = 0, y = 0, z = 7 }, { x = 3, y = 1, z = 6 }))
print(position.same_floor)

local ok, err = pcall(require, "left")

print(ok)
print(string.find(err, "stack overflow", 1, true) ~= nil)
