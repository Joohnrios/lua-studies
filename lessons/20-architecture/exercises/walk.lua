local point = require("point")

local walk = {}

function walk.line(actor, dx, dy)
  local next_point = point.step(actor, dx, dy)
  return actor.name .. " " .. next_point.x .. "," .. next_point.y
end

return walk
