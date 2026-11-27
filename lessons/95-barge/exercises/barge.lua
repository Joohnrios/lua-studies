local Barge = {}
Barge.__index = Barge

function Barge.new(soffit)
  return setmetatable({ soffit = soffit }, Barge)
end

function Barge:trim()
  self.soffit:set()
  return self.soffit:once()
end

function Barge:kept()
  return self.soffit:once()
end

return Barge
