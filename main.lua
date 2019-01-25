bump = require "lib.bump"
player = require "src.player"

function love.load()
    player.img = love.graphics.newImage('assets/character_block.png')

end


function love.update(dt)
    player.x = player.x + player.xVelocity
    player.y = player.y + player.yVelocity

    player.xVelocity = player.xVelocity * (1 - math.min( dt * player.friction, 1))
    player.yVelocity = player.yVelocity * (1 - math.min( dt * player.friction, 1))

    player.yVelocity = player.yVelocity + player.gravity * dt

    if love.keyboard.isDown("left", "a") and player.xVelocity > -player.maxSpeed then
        player.xVelocity = player.xVelocity - player.acc * dt
    elseif love.keyboard.isDown("right", "d") and player.xVelocity < player.maxSpeed then
        player.xVelocity = player.xVelocity + player.acc * dt
    end

    if love.keyboard.isDown("up", "w") then
        if -player.yVelocity < player.jumpMaxSpeed and not player.hasReachedMax then
            player.yVelocity = player.yVelocity - player.jumpAcc * dt
        elseif math.abs( player.yVelocity ) > player.jumpMaxSpeed then
            player.hasReachedMax = true
        end

        player.isGrounded = false
    end

end

function love.keypressed(key)
end

function love.draw(dt)
    love.graphics.draw(player.img, player.x, player.y)
end