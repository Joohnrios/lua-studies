local Stride = {}
Stride.__index = Stride

function Stride.new(pace)
  return setmetatable({ pace = pace }, Stride)
end

function Stride:play()
  local before = self.pace:kept()
  local after = self.pace:take()
  if after > before then
    return "rise"
  end
  return "hold"
end

function Stride:open()
  return self.pace:kept() > 0
end

return Stride
