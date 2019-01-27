local Tower = require("src.tower")
local Utils = require("src.utils")

TowerPet = Utils.inheritsFrom(Tower)

TowerPet.imgPath = "assets/cat.png"

function TowerPet:new()
  local ta = self.create()
  Tower.new(ta)
  return ta
end

return TowerPet