local point = {}

local function gap(a, b)
  return math.abs(a - b)
end

function point.step(current, dx, dy)
  return {
    x = current.x + dx,
    y = current.y + dy,
  }
end

function point.distance(a, b)
  return gap(a.x, b.x) + gap(a.y, b.y)
end

return point
