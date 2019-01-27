local Enemy = require("src.enemy")
local Utils = require("src.utils")
local Class = require("lib.hump.class")
local EnemyDrugs = Class{__includes = Enemy}

function EnemyDrugs:init()
  Enemy.init(self, "assets/images/syringe.png")
end

return EnemyDrugs