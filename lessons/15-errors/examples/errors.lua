local function divide(total, count)
  assert(count ~= 0, "count is zero")
  return total / count
end

print(divide(10, 2))
print(assert("pikachu"))
print(assert(0, "zero"))

local ok, result = pcall(divide, 10, 0)

print(ok)
print(type(result))

local function fail()
  error("hp missing")
end

local handled_ok, handled = xpcall(fail, function(message)
  return "handled: " .. message
end)

print(handled_ok)
print(type(handled))
