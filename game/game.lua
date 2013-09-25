require 'game.entities'

game = {}

bg = {r = 34, g = 60, b = 69}
rpad = Paddle:new(30, 30, 120, 5, 'l') 
lpad = Paddle:new(30, 30, 120, 5, 'r')

function game.draw()
    love.graphics.setBackgroundColor(bg.r, bg.g, bg.b)

    rpad:draw()
    lpad:draw()
end

function game.keypressed(k)
    if k == 'q' then
        love.event.push('quit')
        print 'test'
    end
end
