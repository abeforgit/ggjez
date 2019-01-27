local Tower = require("src.tower")
local EnemyDeath = require("src.enemyDeath")
local Utils = require("src.utils")
local Vector = require("lib.hump.vector")

TowerPet = Utils.inheritsFrom(Tower)

TowerPet.imgPath = "assets/images/cat.png"
TowerPet.evilSide = EnemyDeath

function TowerPet:new()
  local ta = self.create()
  Tower.new(ta, "assets/images/cat.png")
  ta.pImage = love.graphics.newImage("assets/particles/laserpart.png")

  ta.ps = love.graphics.newParticleSystem(ta.pImage, 40)
  ta.ps:setParticleLifetime(1)
  ta.ps:setEmissionRate(20)
  ta.ps:setSpeed(200, 500)
  ta.ps:setRadialAcceleration(110, 150)
  ta.ps:stop()
  return ta
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
