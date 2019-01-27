local Enemy = require("src.enemy")
local Utils = require("src.utils")
local Minion = require("src.enemyMinion")
local Class = require("lib.hump.class")


-- EnemyDoubt = Utils.inheritsFrom(Enemy)

local EnemyDoubt = Class{__includes = Enemy}

function EnemyDoubt:init()
  self.range = 1000
  self.attacksPerSecond = 0.33
  Enemy.init(self, "assets/images/doubt.png")
end

function EnemyDoubt:attack()

  self.scene:addActor(Minion(), self.x, self.y)
  

end



return EnemyDoubt