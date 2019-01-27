local Tower = require("src.tower")
local Utils = require("src.utils")
local EnemyDrugs = require("src.enemyDrugs")
local Class = require("lib.hump.class")

-- TowerMedication = Utils.inheritsFrom(Tower)



local TowerMedication = Class{__includes = Tower}

TowerMedication.imgPath = "assets/images/pill.png"
TowerMedication.evilSide = EnemyDrugs


function TowerMedication:new()
  Tower.init(self)
end

return TowerMedication