local Enemy = require("src.enemy")
local Utils = require("src.utils")
local Class = require("lib.hump.class")


-- EnemyDeath = Utils.inheritsFrom(Enemy)

local EnemyDeath = Class{__includes = Enemy}

function EnemyDeath:init()
  Enemy.init(self, "assets/images/death.png")
end

function EnemyDeath:attack()
end

return EnemyDeath