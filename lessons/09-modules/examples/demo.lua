package.path = package.path .. ";./lessons/09-modules/examples/?.lua"

local greet = require("greet")
local again = require("greet")

print(greet.message("lua"))
print(greet.loads)
print(again == greet)
print(greet.decorate)
