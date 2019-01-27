local Tower = require("src.tower")
local EnemyDeath = require("src.enemyDeath")
local Utils = require("src.utils")
local Vector = require("lib.hump.vector")
local Class = require("lib.hump.class")


-- TowerPet = Utils.inheritsFrom(Tower)
local TowerPet = Class{__includes = Tower}

TowerPet.imgPath = "assets/images/cat.png"
TowerPet.evilSide = EnemyDeath

function TowerPet:init()
  Tower.init(self, "assets/images/cat.png")
  self.pImage = love.graphics.newImage("assets/particles/laserpart.png")

  self.ps = love.graphics.newParticleSystem(self.pImage, 40)
  self.ps:setParticleLifetime(1)
  self.ps:setEmissionRate(20)
  self.ps:setSpeed(200, 500)
  self.ps:setRadialAcceleration(110, 150)
  self.ps:stop()
end

function TowerPet:attack(targets)

  local tgt = targets[1]
  local v1 = Vector.new(self.x, self.y)
  local v2 = Vector.new(tgt.x, tgt.y)
  self.ps:start()
  self.ps:setDirection((v2-v1):angleTo(Vector.new(1,0 )))
  self.ps:emit(40)
  self.ps:stop()
end
function TowerPet:update(dt)
  self.ps:update(dt)
  Tower.update(self, dt)
end

function TowerPet:draw()
  Tower.draw(self)
  love.graphics.draw(self.ps, self.x + self.w/2, self.y + self.h/2)
end


return TowerPet
