local Tower = require("src.tower")
local Utils = require("src.utils")

TowerMedication = Utils.inheritsFrom(Tower)

TowerMedication.imgPath = "assets/pill.png"

function TowerMedication:new()
  local ta = self.create()
  Tower.new(ta)
  return ta
end

return TowerMedication