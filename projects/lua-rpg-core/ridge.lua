local Ridge = {}
Ridge.__index = Ridge

function Ridge.new(roof)
  return setmetatable({ roof = roof }, Ridge)
end

function Ridge:play()
  local before = self.roof:kept()
  local after = self.roof:cover()
  if after > before then
    return "rise"
  end
  return "hold"
end

function Ridge:open()
  return self.roof:kept() > 0
end

return Ridge
