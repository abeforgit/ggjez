local Enemy = {
  health = 100,
  image = nil,
  speed = 100
}

function Enemy:new(x, y, player)
  local plr = {}
  setmetatable(plr, self)
  self.__index = self
  self.image = love.graphics.newImage("assets/enemy.png")
  self.x = x
  self.y = y
  self.target = player
  return plr
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
