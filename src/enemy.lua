local Utils = require("src.utils")
local Actor = require("src.actor")
local Class = require("lib.hump.class")

-- Enemy = Utils.inheritsFrom(Actor)

local Enemy = Class{__includes = Actor}

Enemy.speed = 100
Enemy.health = 100
Enemy.type = "enemy"
Enemy.attackTimer = 0
Enemy.attacksPerSecond = 1
Enemy.attackSounds = {
    love.audio.newSource("assets/sounds/enemy_attacks_1.ogg", "static"),
    love.audio.newSource("assets/sounds/enemy_attacks_2.ogg", "static"),
    love.audio.newSource("assets/sounds/enemy_attacks_3.ogg", "static"),
    love.audio.newSource("assets/sounds/enemy_attacks_4.ogg", "static")
}
Enemy.deathSounds = {
    love.audio.newSource("assets/sounds/enemy_dies_1.ogg", "static"),
    love.audio.newSource("assets/sounds/enemy_dies_2.ogg", "static"),
    love.audio.newSource("assets/sounds/enemy_dies_3.ogg", "static")
}
Enemy.damage = 0

function Enemy:init(imagePath)
  Actor.init(self)
  self.img = love.graphics.newImage(imagePath)
  self.visionFilter = function(item, other)
    if other.type == "player" then
      return "cross"
    end
    return false
  end
end

function Enemy:update(dt)
  Actor.update(self, dt)
  
  self.attackTimer = self.attackTimer + dt
  local dx = self.scene.player.x - self.x
  local dy = self.scene.player.y - self.y
  local length = math.sqrt(dx*dx + dy*dy)
  if length ~= 0 then
    local targetX = self.x + (dx / length) * dt * self.speed
    local targetY = self.y + (dy / length) * dt * self.speed
    local collisionFilter = function(item, other)
      if (other.solid and item.solid and other.type ~= "enemy") then
        return "bounce"
      else
        return false
      end
    end

    local newX, newY, cols, len = self.scene.world:move(self, targetX, targetY, collisionFilter)
    if(#self.seen > 0) then
      if self.attackTimer > self.attacksPerSecond then
        self:attack()
        self.attackTimer = 0
      end
    end
    self.x = newX
    self.y = newY
    
  end
end

function Enemy:attack()
  for i = 1,#self.seen do
    if self.seen[i].other.type == "player" then
      self.attackSounds[math.random(1, #self.attackSounds)]:play()
      self.seen[i].other:takeDamage(self.damage)
    end
  end
end

function Enemy:takeDamage(dmg)
  self.health = self.health - dmg
  if self.health < 0 then
    self:die()
  end
end

function Enemy:die()
  self.deathSounds[math.random(1, #self.deathSounds)]:play()
  self.scene.player:heal(25)
  self.scene:removeActor(self)
end

return Enemy
