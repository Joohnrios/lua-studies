local Brief = {}
Brief.__index = Brief

function Brief.new(dialogue, hunt)
  return setmetatable({
    dialogue = dialogue,
    hunt = hunt,
  }, Brief)
end

function Brief:say()
  if self.hunt:report() == "done" then
    return self.dialogue.name .. " is done"
  end
  return self.dialogue:next()
end

function Brief:waiting()
  return self.hunt:report() == "open"
end

return Brief
