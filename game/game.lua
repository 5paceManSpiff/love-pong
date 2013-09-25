require 'game.entities'

rscore = 0
lscore = 0

game = {}

local function reset()
    bg = {r = 34, g = 60, b = 69}
    rpad = Paddle:new(30, 26, 134, 10, 'r') 
    lpad = Paddle:new(30, 26, 134, 10, 'l')
    ball = Ball:new(26, 26, 5)
end

function game.enter()
    love.graphics.setFont(font[20])
    reset()
end

function game.draw()
    love.graphics.setBackgroundColor(bg.r, bg.g, bg.b)

    rpad:draw()
    lpad:draw()
    ball:draw()

    love.graphics.print(lscore, 10, 10)
    local rscore_ypos = love.graphics.getWidth() - 10 - love.graphics.getFont():getWidth(rscore)
    love.graphics.print(rscore, rscore_ypos, 10) 
end

function game.update(d)
    local working = true

    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if rpad:bumping(ball) then
        local bumped = ((rpad.y + rpad.h/2) - (ball.y + ball.h/2)) * -1
        ball.speed.y = bumped/15
        ball.speed.x = ball.speed.x * -1
    elseif lpad:bumping(ball) then
        local bumped = ((lpad.y + lpad.h/2) - (ball.y + ball.h/2)) * -1
        ball.speed.y = bumped/15
        ball.speed.x = ball.speed.x * -1
    end

    if lpad.x >= ball.x then
        rscore = rscore + 1
        working = false
    elseif rpad.x + rpad.w <= ball.x then
        lscore = lscore + 1
        working = false
    end

    if ball.y + ball.h >= love.graphics.getHeight() or ball.y <= 0 then
        ball.speed.y = ball.speed.y * -1
    end

    if working then
        ball:update()
        rpad:update('up', 'down')
        lpad:update('w', 's')
    else
        reset()
    end
end
