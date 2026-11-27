local Bridge = {}
Bridge.__index = Bridge

function Bridge.new(lane)
  return setmetatable({ lane = lane }, Bridge)
end

function Bridge:span()
  self.lane:cross()
  return self.lane:once()
end

function Bridge:kept()
  return self.lane:once()
end

return Bridge
