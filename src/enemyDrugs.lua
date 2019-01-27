local Enemy = require("src.enemy")
local Utils = require("src.utils")
local Class = require("lib.hump.class")
local EnemyDrugs = Class{__includes = Enemy}

function EnemyDrugs:init()
  Enemy.init(self, "assets/images/syringe.png")
  self.damage = 5
end

function EnemyDrugs:attack()
  self.seen[1].other:takeDamage(self.damage)
  
end

return EnemyDrugs