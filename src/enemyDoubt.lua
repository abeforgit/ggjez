local Enemy = require("src.enemy")
local Utils = require("src.utils")
local Class = require("lib.hump.class")


-- EnemyDoubt = Utils.inheritsFrom(Enemy)

local EnemyDoubt = Class{__includes = Enemy}

function EnemyDoubt:init()
  Enemy.init(self, "assets/images/doubt.png")
end

return EnemyDoubt