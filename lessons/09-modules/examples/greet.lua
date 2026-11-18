local greet = { loads = 0 }

greet.loads = greet.loads + 1

local function decorate(name)
  return "hello, " .. name
end

function greet.message(name)
  return decorate(name)
end

return greet
