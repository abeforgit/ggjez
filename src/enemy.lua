local Utils = require("src.utils")
local Actor = require("src.actor")

Enemy = Utils.inheritsFrom(Actor)

function Enemy:new(x, y, target, imagePath)
  local enemy = self.create()
  self.img = love.graphics.newImage(imagePath)
  self.x = x
  self.y = y
  self.speed = 100
  self.health = 100
  self.target = target
  self.type = "enemy"
  return enemy
end

function Enemy:print()
  print("Enemy")
end

function Enemy:update(dt)
  local dx = self.target.x - self.x
  local dy = self.target.y - self.y
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
