local steps = require("steps")

local log = {}

function log.record(player, amount)
  local total = steps.gain(player, amount)
  return player.name .. " " .. total
end

return log
