local class = require 'middleclass.middleclass'

Paddle = class('Paddle')

function Paddle:initialize(edge_offset, w, h, speed, side)
    self.speed = speed
    self.side = side
    self.w = w
    self.h = h

    self.y = love.graphics.getHeight()/2 - h/2

    if side == 'l' then
        self.x = edge_offset
    elseif side == 'r' then
        self.x = love.graphics.getWidth() - edge_offset - w
    end
end

function Paddle:bumping(ball)
    -- check if ball is within paddles y boundaries
    if self.y < ball.y + ball.h and self.y + self.h > ball.y then
        if self.side == 'l' then
            -- check if ball overlaps left paddle
            if self.x + self.w >= ball.x then
                return true
            else
                return false
            end
        elseif self.side == 'r' then
            -- check if ball overlaps right paddle
            if self.x <= ball.x + ball.w then
                return true
            else
                return false
            end
        end
    else
        return false
    end
end

function Paddle:update(up, down)
    if love.keyboard.isDown(up) and not love.keyboard.isDown(down) then
        self.y = self.y - self.speed
    end
    if love.keyboard.isDown(down) and not love.keyboard.isDown(up) then
        self.y = self.y + self.speed
    end
end

function Paddle:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

Ball = class('Ball')

function Ball:initialize(w, h, speed)
    self.w = w
    self.h = h
    self.speed = {x = speed, y = 0}
    self.x = love.graphics.getWidth()/2 - w/2
    self.y = love.graphics.getHeight()/2 - h/2
end

function Ball:update()
    self.x = self.x + self.speed.x
    self.y = self.y + self.speed.y
end

function Ball:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end
