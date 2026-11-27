local Arch = {}
Arch.__index = Arch

function Arch.new(bridge)
  return setmetatable({ bridge = bridge }, Arch)
end

function Arch:play()
  local before = self.bridge:kept()
  local after = self.bridge:span()
  if after > before then
    return "rise"
  end
  return "hold"
end

function Arch:open()
  return self.bridge:kept() > 0
end

return Arch
