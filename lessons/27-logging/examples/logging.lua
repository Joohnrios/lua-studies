local ranks = {
  debug = 1,
  info = 2,
  warn = 3,
  error = 4,
}

local function logger(minimum)
  local threshold = ranks[minimum]

  return function(level, message)
    if ranks[level] < threshold then
      return nil
    end
    return level .. " " .. message
  end
end

local log = logger("info")

print(log("debug", "tick"))
print(log("info", "ready"))
print(log("error", "down"))
