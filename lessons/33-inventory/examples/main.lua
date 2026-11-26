package.path = "./lessons/33-inventory/examples/?.lua;" .. package.path

local Inventory = require("inventory")

local bag = Inventory.new()

print(bag:add({ name = "potion", count = 2 }))
print(bag:add({ name = "potion", count = 3 }))
print(bag:add({ name = "ball", count = 1 }))
print(bag:count("potion"))
print(bag:count("berry"))
print(#bag.slots)
