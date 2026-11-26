local Hunt = {}
Hunt.__index = Hunt

function Hunt.new(spoils, quest)
  return setmetatable({
    spoils = spoils,
    quest = quest,
  }, Hunt)
end

function Hunt:finish(target)
  local before = target.hp
  local level = self.spoils:collect(target)
  if before > 0 and target.hp == 0 then
    self.quest:advance(1)
  end
  return level
end

function Hunt:report()
  return self.quest:status()
end

return Hunt
