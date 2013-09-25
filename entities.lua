require 'middleclass.middleclass'

Paddle = class('Paddle')

function Paddle:initialize(screenx, edge_offset,  w, h, speed, side)
    self.speed = speed
    self.side = side
    self.w = w
    self.h = h

    if side == 'l' then
        self.x = edge_offset
    elseif side == 'r' then
        self.x = screenx - edge_offset - w
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

Ball = class('Ball')

function Ball:initialize(w, h)
    self.w = w
    self.h = h
end
