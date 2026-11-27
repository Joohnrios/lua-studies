local Hip = {}
Hip.__index = Hip

function Hip.new(purlin)
  return setmetatable({ purlin = purlin }, Hip)
end

function Hip:raise()
  self.purlin:seat()
  return self.purlin:once()
end

function Hip:kept()
  return self.purlin:once()
end

return Hip
