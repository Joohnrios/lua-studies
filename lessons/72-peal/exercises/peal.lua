local Peal = {}
Peal.__index = Peal

function Peal.new(chime)
  return setmetatable({ chime = chime }, Peal)
end

function Peal:sound()
  self.chime:ring()
  return self.chime:once()
end

function Peal:kept()
  return self.chime:once()
end

return Peal
