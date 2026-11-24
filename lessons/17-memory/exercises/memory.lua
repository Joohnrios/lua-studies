-- Exercise 17 — Memory
-- Write each prediction before running this file.
--
--   lua lessons/17-memory/exercises/memory.lua

-- Part A
-- predicted item: nil
-- predicted title: joy

local bag = setmetatable({}, { __mode = "v" })
local ball = { name = "ultra" }

bag.item = ball
ball = nil
collectgarbage("collect")
print(bag.item)

local titles = setmetatable({}, { __mode = "k" })

titles["nurse"] = "joy"
collectgarbage("collect")
print(titles["nurse"])

-- Part B
-- Implement cache_creatures().
-- Return put(id, creature) and get(id).
-- Store the creatures as weak values.
-- Do not create a global.

local function cache_creatures()
  local items = setmetatable({}, { __mode = "v" })

  local function put(id, creature)
    items[id] = creature
  end

  local function get(id)
    return items[id]
  end

  return put, get
end

-- Part C
-- Implement notes().
-- Return set_note(creature, text), get_note(creature), and count_notes().
-- Store the notes with weak keys.
-- Do not create a global.

local function notes()
  local stored = setmetatable({}, { __mode = "k" })

  local function set_note(creature, text)
    stored[creature] = text
  end

  local function get_note(creature)
    return stored[creature]
  end

  local function count_notes()
    local count = 0
    for _ in pairs(stored) do
      count = count + 1
    end
    return count
  end

  return set_note, get_note, count_notes
end

local put, get = cache_creatures()
local monster = { name = "pika", hp = 20 }

put(1, monster)
print(get(1).name)

monster = nil
collectgarbage("collect")
print(get(1))

local set_note, get_note, count_notes = notes()
local npc = { name = "joy" }

set_note(npc, "nurse")
print(get_note(npc))

local still = npc

npc = nil
collectgarbage("collect")
print(count_notes())

still = nil
collectgarbage("collect")
print(count_notes())
