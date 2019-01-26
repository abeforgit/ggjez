local Utils = require("src.utils")
local Actor = require("src.actor")

Enemy = Utils.inheritsFrom(Actor)

Enemy.speed = 100
Enemy.health = 100
Enemy.type = "enemy"
Enemy.visionRect = nil
Enemy.range = 100

function Enemy:new(imagePath)
  local enemy = self.create()
  self.img = love.graphics.newImage(imagePath)
  self.visionRect = {
    l = self.x - self.range/2,
    t = self.y - self.range/2,
    w = self.w + self.range,
    h = self.h + self.range
  }
  return enemy
end

function Enemy:update(dt)
  local dx = self.scene.player.x - self.x
  local dy = self.scene.player.y - self.y
  local length = math.sqrt(dx*dx + dy*dy)
  if length ~= 0 then
    local targetX = self.x + (dx / length) * dt * self.speed
    local targetY = self.y + (dy / length) * dt * self.speed
    local playerFilter = function(item, other)
      if item.type ~= nil then
        return "bounce"
      end
      return "cross"
    end
    local newX, newY, cols, len = self.scene.world:move(self, targetX, targetY, playerFilter)
    self.x = newX
    self.y = newY
  end

  
end

function Enemy:takeDamage(dmg)
  self.health = self.health - dmg
  if self.health < 0 then
    self:die()
  end
end

function Enemy:die()
  self.scene:removeActor(self)
end

return Enemy
