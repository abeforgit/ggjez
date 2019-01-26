local Tower = require("src.tower")
local Utils = require("src.utils")

TowerMedication = Utils.inheritsFrom(Tower)

function TowerMedication:new()
  local ta = self.create()
  Tower.new(ta, "assets/pill.png")
  return ta
end

return TowerMedication