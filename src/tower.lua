local Tower = {
    x = 100,
    y = 100,
    img = nil
}

function Tower:new()
    local twr = {}
    setmetatable(twr, self)
    self.__index = self
    self.img = love.graphics.newImage("assets/tower.png")
    return twr
end

function Tower:update(dt)
    -- check if enemies in range
end

function Tower:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

return Tower