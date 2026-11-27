local Eave = {}
Eave.__index = Eave

function Eave.new(gable)
  return setmetatable({ gable = gable }, Eave)
end

function Eave:hang()
  self.gable:fit()
  return self.gable:once()
end

function Eave:kept()
  return self.gable:once()
end

return Eave
