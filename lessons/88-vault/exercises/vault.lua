local Vault = {}
Vault.__index = Vault

function Vault.new(arch, events)
  return setmetatable({
    arch = arch,
    events = events,
  }, Vault)
end

function Vault:lay()
  local word = self.arch:play()
  if word == "rise" then
    self.events:emit(word)
  end
  return word
end

function Vault:once()
  return self.events:count("rise")
end

return Vault
