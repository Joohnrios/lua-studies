local slip = {}

function slip.text(name, result)
  return name .. " " .. result.state .. " " .. result.coins
end

return slip
