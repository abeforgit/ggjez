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
  local modifier = severity / 2
  local dx = math.random() * modifier
  local dy = math.random() * modifier
  love.graphics.translate(dx, dy)
end

function Glitches.glitchOverlay(severity)
  local r, g, b, a = love.graphics.getColor()
  local amount = math.random(100)
  local x = math.random(love.graphics.getWidth() - 128)
  local y = math.random(love.graphics.getHeight() - 128)
  love.graphics.setColor(math.random(255) / 255, math.random(255) / 255, math.random(255) / 255)
  if amount <= severity then
    for i = 0, math.log(severity) do
      love.graphics.rectangle("fill", math.random(love.graphics.getWidth()), math.random(love.graphics.getHeight()), math.random(severity), math.random(severity))
    end
  end
  love.graphics.setColor(r,g,b,a)
end
return Glitches