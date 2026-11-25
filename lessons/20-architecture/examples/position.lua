local position = {}

local function same_floor(a, b)
  return a.z == b.z
end

function position.step(current, dx, dy)
  return {
    x = current.x + dx,
    y = current.y + dy,
    z = current.z,
  }
end

function position.distance(a, b)
  if not same_floor(a, b) then
    return nil
  end
  return math.abs(a.x - b.x) + math.abs(a.y - b.y)
end

return position
