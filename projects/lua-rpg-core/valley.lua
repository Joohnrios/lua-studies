local Valley = {}
Valley.__index = Valley

function Valley.new(hip)
  return setmetatable({ hip = hip }, Valley)
end

function Valley:play()
  local before = self.hip:kept()
  local after = self.hip:raise()
  if after > before then
    return "rise"
  end
  return "hold"
end

function Valley:open()
  return self.hip:kept() > 0
end

return Valley
