local Notice = {}
Notice.__index = Notice

function Notice.new(dialogue, order)
  return setmetatable({
    dialogue = dialogue,
    order = order,
  }, Notice)
end

function Notice:say()
  if self.order:report() == "done" then
    return self.dialogue.name .. " is done"
  end
  return self.dialogue:next()
end

function Notice:waiting()
  return self.order:report() == "open"
end

return Notice
