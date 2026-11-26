local function inner()
  error("hp missing")
end

local function outer()
  inner()
end

local ok, err = xpcall(outer, function(message)
  return debug.traceback(message, 2)
end)

print(ok)
print(string.find(err, "hp missing", 1, true) ~= nil)
print(string.find(err, "inner", 1, true) ~= nil)
print(string.find(err, "outer", 1, true) ~= nil)

local function locate()
  local info = debug.getinfo(1, "nl")
  print(info.name)
  print(type(info.currentline))
end

locate()

local function caller_name()
  return debug.getinfo(2, "n").name
end

local function ask()
  local name = caller_name()
  return name
end

local function ask_tail()
  return caller_name()
end

print(ask())
print(ask_tail())
