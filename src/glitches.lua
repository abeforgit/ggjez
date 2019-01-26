local Glitches = {}

local glitchImages = {
  love.graphics.newImage("assets/black.png"),
  love.graphics.newImage("assets/glitch1.png")
}

function Glitches.moveMouse()
  love.mouse.setX(math.random(100))
  love.mouse.setY(math.random(100))
end

function Glitches.screenShake(severity)
  local modifier = 2 ^ (severity/25) - 1
  local dx = math.random() * modifier
  local dy = math.random() * modifier
  love.graphics.translate(dx, dy)
end

function Glitches.glitchOverlay(severity)
  local amount = math.random(100)
  local x = math.random(love.graphics.getWidth() - 128)
  local y = math.random(love.graphics.getHeight() - 128)
  if amount <= severity then
    love.graphics.draw(glitchImages[math.random(#glitchImages)], x,y, 0, math.random(), math.random())
  end
end
return Glitches