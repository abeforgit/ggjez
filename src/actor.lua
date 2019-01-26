local Actor = {
    scene = nil,
    img = nil,
    x = 0,
    y = 0
}


function Actor:setScene(scn)
    self.scene = scn
end

function Actor:draw()
    love.graphics.draw(self, self.x, self.y)
end

function Actor:update()
end

return Actor