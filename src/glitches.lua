local Glitches = {}

local glitchImages = {
  love.graphics.newImage("assets/black.png"),
  love.graphics.newImage("assets/glitch1.png")
}

function Glitches.moveMouse(severity)
  local dx = math.random(severity * 2) - severity
  local dy = math.random(severity * 2) - severity

  love.mouse.setX(love.mouse.getX() + dx)
  love.mouse.setY(love.mouse.getY() + dy)
end

function Glitches.screenShake(severity)
  local dx = math.random(severity * 2) - severity
  local dy = math.random(severity * 2) - severity
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

function Glitches.setBackground(severity)
  love.graphics.setBackgroundColor((95 / 255) * (1 + severity/100), (205 / 255) * (1 + severity/100), (228 / 255) * (1 + severity/100))
end

return Glitches