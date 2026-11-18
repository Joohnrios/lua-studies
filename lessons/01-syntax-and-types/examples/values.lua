local title = "PXG studies"
local level = 1
local ratio = 1.5
local enabled = true
local missing = nil

print(type(title))
print(type(level))
print(type(ratio))
print(type(enabled))
print(type(missing))
print(type(print))

print(type(1))
print(type(1.0))
print(math.type(1))
print(math.type(1.0))
print(1 == 1.0)

local hp = 0

if hp then
  print("zero is a value")
end

local empty = {}
local greet = function(name)
  return "hello, " .. name
end

print(type(empty))
print(type(greet))
print(greet("lua"))
