local Enemy = require("src.enemy")
local Utils = require("src.utils")
local Class = require("lib.hump.class")


-- EnemyDeath = Utils.inheritsFrom(Enemy)

local EnemyDeath = Class{__includes = Enemy}

function EnemyDeath:init()
  Enemy.init(self, "assets/images/death.png")
  self.damage = 5
  self.target = nil
  self.animationTimer = 0
end

function EnemyDeath:attack()
  self.target = self.seen[1].other
  self.target:takeDamage(self.damage)
  self.attacking = true
end

function EnemyDeath:draw()
  Enemy.draw(self)
  if self.attacking then
    love.graphics.draw(love.graphics.newImage("assets/images/death-attack.png"), self.x + self.w/2 , self.y+self.h/2 , math.pi/4 + math.atan2( self.x - self.target.x, -(self.y - self.target.y) ))
  end
end

function EnemyDeath:update(dt)
  Enemy.update(self,dt)
  if self.attacking then
  self.animationTimer = self.animationTimer + dt
  if self.animationTimer > 0.5 then
    self.animationTimer = 0
    self.attacking = false
  end
  end

  
end

return EnemyDeath