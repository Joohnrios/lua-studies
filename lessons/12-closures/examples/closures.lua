local function counter()
  local total = 0

  return function()
    total = total + 1
    return total
  end
end

local first = counter()
local second = counter()

print(first())
print(first())
print(second())

local functions = {}

for i = 1, 3 do
  functions[i] = function()
    return i
  end
end

for n = 1, 3 do
  print(functions[n]())
end
