local position = require("position")

local travel = {}

function travel.report(actor, dx, dy)
  local next_position = position.step(actor, dx, dy)
  return actor.name .. " " .. next_position.x .. "," .. next_position.y
end

return travel
