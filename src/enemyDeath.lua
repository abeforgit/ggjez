local Enemy = require("src.enemy")
local Utils = require("src.utils")
local Class = require("lib.hump.class")


-- EnemyDeath = Utils.inheritsFrom(Enemy)

local EnemyDeath = Class{__includes = Enemy}

function EnemyDeath:init()
  Enemy.init(self, "assets/images/death.png")
  self.damage = 20
end

function EnemyDeath:attack()
  self.seen[1].other:takeDamage(self.damage)
end

return EnemyDeath