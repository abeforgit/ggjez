local Tower = require("src.tower")
local Utils = require("src.utils")
local EnemyDrugs = require("src.enemyDrugs")

TowerMedication = Utils.inheritsFrom(Tower)

TowerMedication.imgPath = "assets/pill.png"
TowerMedication.evilSide = EnemyDrugs

function TowerMedication:new()
  local ta = self.create()
  Tower.new(ta)
  return ta
end

return TowerMedication