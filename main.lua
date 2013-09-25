gstate = require 'hump.gamestate'

require 'entities'

local game = {}
local bg = {r = 34, g = 60, b = 69}

game.draw = function()
    love.graphics.setBackgroundColor(bg.r, bg.g, bg.b)

    love.graphics.rectangle('fill', 20, 50, 60, 120)
end

love.load = function()
    gstate.registerEvents()
    gstate.switch(game)
end
