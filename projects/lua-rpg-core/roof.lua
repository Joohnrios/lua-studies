local Roof = {}
Roof.__index = Roof

function Roof.new(vault)
  return setmetatable({ vault = vault }, Roof)
end

function Roof:cover()
  self.vault:lay()
  return self.vault:once()
end

function Roof:kept()
  return self.vault:once()
end

return Roof
