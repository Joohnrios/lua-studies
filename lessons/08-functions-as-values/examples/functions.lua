local function twice(fn, value)
  return fn(fn(value))
end

print(twice(function(n)
  return n + 1
end, 10))

local creature = { name = "pikachu", hp = 30 }

function creature:label()
  return self.name .. " hp " .. self.hp
end

print(creature:label())
print(creature.label(creature))

local function fact(n)
  if n == 0 then
    return 1
  end
  return n * fact(n - 1)
end

print(fact(4))
