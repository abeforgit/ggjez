Player = {
    health = 100,
    image = nil,
    x = 100,
    y = 100
}
function Player:new()
    local plr = {}
    setmetatable(plr, self)
    self.__index = self
    self.image = love.graphics.newImage("assets/borb.png")
    return plr
end

function Player:print()
    print("Player: "..self.health)
end

function Player:update(dt)
    self.x = self.x + (0.01/dt)
end

function Player:draw() 
    love.graphics.draw(self.image, self.x, self.y)
end

return Player
