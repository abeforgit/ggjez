util = require("src.utils")

local Actor = {
    scene = nil,
    img = nil,
    x = 0,
    y = 0,
    w = 128,
    h = 128,
    type = "actor",
    solid = true
}

function Actor:setScene(scn)
    self.scene = scn
    self.scene.world:add(self, self.x, self.y, self.w, self.h)
end

function Actor:draw()
    love.graphics.draw(self.img, self.x, self.y)
    if self.visionRect then
        local l, t, w, h = util.unpackRect(self.visionRect)
        love.graphics.rectangle("line", l, t, w, h)
    end
end

function Actor:update()
end

return Actor