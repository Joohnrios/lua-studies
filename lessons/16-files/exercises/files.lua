-- Exercise 16 — Files
-- Write each prediction before running this file.
--
--   lua lessons/16-files/exercises/files.lua

-- Part A
-- predicted line: berry
-- predicted amount: 4
-- predicted kind: closed file

local scratch = assert(io.tmpfile())

scratch:write("berry\n")
scratch:write("4\n")
scratch:seek("set")
print(scratch:read("l"))
print(scratch:read("n"))
scratch:close()
print(io.type(scratch))

-- Part B
-- Implement save_creature(path, creature).
-- Write creature.name and creature.hp on separate lines.
-- Close the file. Do not create a global.

local function save_creature(path, creature)
  local file <close> = assert(io.open(path, "w"))
  file:write(creature.name, "\n")
  file:write(creature.hp, "\n")
end

-- Part C
-- Implement load_creature(path).
-- Read the name and the hp written by save_creature.
-- Return a table { name = name, hp = hp } and keep hp as a number.
-- If the file cannot be opened, return nil and the error message.
-- Do not create a global.

local function load_creature(path)
  local file, err = io.open(path, "r")
  if file == nil then
    return nil, err
  end
  local input <close> = file
  local name = input:read("l")
  local hp = input:read("n")
  return { name = name, hp = hp }
end

local path = "lessons/16-files/exercises/creature.txt"

save_creature(path, { name = "pika", hp = 30 })

local creature = load_creature(path)

print(creature.name)
print(creature.hp)
print(type(creature.hp))

local missing, err = load_creature("lessons/16-files/exercises/missing.txt")

print(missing)
print(type(err))
os.remove(path)
