local Tower = {
    x = 100,
    y = 100,
    health = 100,
    w = 128,
    h = 128,
    img = nil
}

function Tower:new(scene)
    local twr = {}
    setmetatable(twr, self)
    self.__index = self
    self.img = love.graphics.newImage("assets/tower.png")
    return twr
end

function Tower:update(dt)
    if self.health <= 0
    then
        -- remove
    end
end

function Tower:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

return Tower