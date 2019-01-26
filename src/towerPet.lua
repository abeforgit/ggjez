local Tower = require("src.tower")
local Utils = require("src.utils")

TowerPet = Utils.inheritsFrom(Tower)

function TowerPet:new()
  local ta = self.create()
  Tower.new(ta, "assets/cat.png")
  return ta
end

return TowerPet