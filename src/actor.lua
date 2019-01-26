local Actor = {
    scene = nil,
    img = nil,
    x = 0,
    y = 0,
    w = 128,
    h = 128
}

function Actor:setScene(scn)
    self.scene = scn
    self.scene.world:add(self, self.x, self.y, self.w, self.h)
end

function Actor:draw()
    love.graphics.draw(self, self.x, self.y)
end

function Actor:update()
end

return Actor