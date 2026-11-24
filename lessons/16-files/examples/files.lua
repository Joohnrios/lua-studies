local scratch = assert(io.tmpfile())

scratch:write("pikachu\n")
scratch:write("25\n")
scratch:seek("set")

print(scratch:read("l"))
print(scratch:read("n"))
scratch:close()
print(io.type(scratch))

local path = "lessons/16-files/examples/creature.txt"
local handle

do
  local out <close> = assert(io.open(path, "w"))
  out:write("potion\n")
  out:write("3\n")
  handle = out
end

print(io.type(handle))

local name
local hp

do
  local input <close> = assert(io.open(path, "r"))
  name = input:read("l")
  hp = input:read("n")
end

print(name)
print(hp)
print(math.type(hp))

local missing, err = io.open("lessons/16-files/examples/missing.txt", "r")

print(missing)
print(type(err))
os.remove(path)
