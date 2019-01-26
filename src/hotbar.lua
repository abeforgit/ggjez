Hotbar = {
    slot1 = nil,
    slot2 = nil,
    slot3 = nil,
    img = love.graphics.newImage("assets/bettergui.png")
}

function Hotbar:new()
    local hb = {}
    setmetatable(hb, self) 
    self.__index = self
    return hb
end

function Hotbar:draw()
    local width = love.graphics.getWidth()
    local newX = width/2 - self.img:getWidth()/2  
    love.graphics.draw(self.img, newX, 0)
end

return Hotbar