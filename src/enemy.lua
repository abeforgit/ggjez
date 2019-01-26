Utils = require("src.utils")
Actor = require("src.actor")

Enemy = Utils.inheritsFrom(Actor)

function Enemy:new(x, y, player, imagePath)
  local enemy = self.create()
  self.image = love.graphics.newImage(imagePath)
  self.x = x
  self.y = y
  self.speed = 100
  self.health = 100
  self.target = player
  return enemy
end

function Enemy:print()
  print("Enemy")
end

function Enemy:update(dt)
  local dx = self.target.x - self.x
  local dy = self.target.y - self.y
  local length = math.sqrt(dx*dx + dy*dy)
  self.x = self.x + (dx / length) * dt * self.speed
  self.y = self.y + (dy / length) * dt * self.speed
end

function Enemy:draw() 
  love.graphics.draw(self.image, self.x, self.y)
end

return Enemy
