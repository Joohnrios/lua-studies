local function joined(count)
  local parts = {}
  for index = 1, count do
    parts[index] = "x"
  end
  return table.concat(parts)
end

local function repeated(count)
  local text = ""
  for _ = 1, count do
    text = text .. "x"
  end
  return text
end

local sample = { "pika", "10" }

print(table.concat(sample, " "))
print(joined(3) == repeated(3))

local function seconds(build, count)
  local start = os.clock()
  build(count)
  return os.clock() - start
end

local count = 40000

print(seconds(joined, count) < seconds(repeated, count))
