local Tower = require("src.tower")
local Utils = require("src.utils")
local EnemyDrugs = require("src.enemyDrugs")
local Class = require("lib.hump.class")

-- TowerMedication = Utils.inheritsFrom(Tower)



local TowerMedication = Class{__includes = Tower}

TowerMedication.imgPath = "assets/images/pill.png"
TowerMedication.evilSide = EnemyDrugs


function TowerMedication:init()
  Tower.init(self)
  self.damage = 50
end

return TowerMedication