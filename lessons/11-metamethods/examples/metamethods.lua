local pocket = {}
local creature = {}

setmetatable(creature, {
  __newindex = function(_, key, value)
    pocket[key] = value
  end,
})

creature.hp = 10

print(rawget(creature, "hp"))
print(pocket.hp)

local mt = {}

function mt.__add(a, b)
  return setmetatable({ x = a.x + b.x, y = a.y + b.y }, mt)
end

function mt.__tostring(value)
  return value.x .. "," .. value.y
end

function mt.__eq(a, b)
  return a.x == b.x and a.y == b.y
end

function mt.__call(value, scale)
  return setmetatable({ x = value.x * scale, y = value.y * scale }, mt)
end

local function vector(x, y)
  return setmetatable({ x = x, y = y }, mt)
end

local a = vector(1, 2)
local b = vector(3, 4)
local sum = a + b

print(sum.x, sum.y)
print(tostring(a))
print(a == vector(1, 2))

local scaled = a(10)

print(scaled.x, scaled.y)
