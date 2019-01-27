local Enemy = require("src.enemy")
local Utils = require("src.utils")
local Class = require("lib.hump.class")


-- EnemyDoubt = Utils.inheritsFrom(Enemy)

local EnemyMinion = Class{__includes = Enemy}

function EnemyMinion:init()
    self.speed = 300
    self.range = 150
    self.lifetime = 0
    self.maxlife = 3
    self.attacksPerSecond = 0.5
    self.damage = 0.5
    self.health = 50
  Enemy.init(self, "assets/images/NANI.png")
end

function EnemyMinion:attack()
    Enemy.attack(self)
end

function EnemyMinion:update(dt)
    Enemy.update(self, dt)
    self.lifetime = self.lifetime + dt
    if (self.lifetime > self.maxlife) then
        self:die()
    end
end

function EnemyMinion:die()
    self.scene:removeActor(self)
end


return EnemyMinion