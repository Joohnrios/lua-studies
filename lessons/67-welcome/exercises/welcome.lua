local Welcome = {}
Welcome.__index = Welcome

function Welcome.new(presence, dialogue)
  return setmetatable({
    presence = presence,
    dialogue = dialogue,
  }, Welcome)
end

function Welcome:greet()
  if self.presence:mark() then
    return self.dialogue:next()
  end
  return self.dialogue.name .. " is away"
end

function Welcome:status()
  if self.presence:seen() then
    return "here"
  end
  return "away"
end

return Welcome
