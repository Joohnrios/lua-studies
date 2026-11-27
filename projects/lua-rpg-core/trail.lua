local Trail = {}
Trail.__index = Trail

function Trail.new(march, events)
  return setmetatable({
    march = march,
    events = events,
  }, Trail)
end

function Trail:step()
  local word = self.march:walk()
  if word == "moved" then
    self.events:emit(word)
  end
  return word
end

function Trail:moves()
  return self.events:count("moved")
end

return Trail
