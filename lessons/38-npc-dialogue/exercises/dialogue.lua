local Dialogue = {}
Dialogue.__index = Dialogue

function Dialogue.new(name, lines)
  return setmetatable({
    name = name,
    lines = lines,
    step = 1,
  }, Dialogue)
end

function Dialogue:next()
  local line = self.lines[self.step]
  if line == nil then
    return self.name .. " is done"
  end
  self.step = self.step + 1
  return line
end

function Dialogue:finished()
  return self.lines[self.step] == nil
end

return Dialogue
