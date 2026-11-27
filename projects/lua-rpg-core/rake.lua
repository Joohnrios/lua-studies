local Rake = {}
Rake.__index = Rake

function Rake.new(barge)
  return setmetatable({ barge = barge }, Rake)
end

function Rake:play()
  local before = self.barge:kept()
  local after = self.barge:trim()
  if after > before then
    return "rise"
  end
  return "hold"
end

function Rake:open()
  return self.barge:kept() > 0
end

return Rake
