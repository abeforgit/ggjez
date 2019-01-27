local SceneWarning = require("src.sceneWarning")

local Main = {
    scn = nil
}

function love.load()
    Main:setScene(SceneWarning(Main))
    love.window.setFullscreen(true)
end

function love.update(dt)
    Main.scn:update(dt)
end

function love.keypressed(key)
end

function Main:setScene(scn)
    Main.scn = scn
    love.mousereleased = scn:mousereleased()
    love.keypressed = scn:keypressed()
    love.keyreleased = scn:keyreleased()
    love.mousepressed = scn:mousepressed()
    love.wheelmoved = scn:wheelmoved()
end

function love.draw(dt)
    Main.scn:draw()
end

