Healthbar = {
    scene = nil
}

function Healthbar:new()
    local hb = {}
    setmetatable(hb, self) 
    self.__index = self
    return hb
end

function Healthbar:setScene(scene)
    self.scene = scene
end

function Healthbar:draw()
    local r, g, b, a = love.graphics.getColor()

    love.graphics.draw(love.graphics.newImage("assets/images/health.png"), love.graphics.getWidth() / 2 - 256, love.graphics.getHeight() - 64)

    love.graphics.setColor(105 / 255,106 / 255,106 / 255)
    love.graphics.rectangle("fill", love.graphics.getWidth() / 2, love.graphics.getHeight() - 64, love.graphics.getWidth() / 2, 64)

    love.graphics.setColor(155 / 255, 173 / 255, 183 / 255)
    love.graphics.rectangle("fill", love.graphics.getWidth() / 2 + 8, love.graphics.getHeight() - 56, (love.graphics.getWidth() / 2 - 16), 48)

    local health = self.scene.player.health

    if (health >= 50) then
        love.graphics.setColor(106 / 255, 190 / 255, 48 / 255)
    elseif (health >= 25) then
        love.graphics.setColor(223 / 255, 113 / 255, 38 / 255)
    else
        love.graphics.setColor(172 / 255, 50 / 255, 50 / 255)
    end

    love.graphics.rectangle("fill", love.graphics.getWidth() / 2 + 8, love.graphics.getHeight() - 56, (love.graphics.getWidth() / 2 - 16) * (health / 100), 48)
    
    love.graphics.setColor(r,g,b,a)
end

return Healthbar