gstate = require 'hump.gamestate'

font = {}
font[20] = love.graphics.newFont(20)

require 'game.game'

function love.load()
    gstate.registerEvents()
    gstate.switch(game)
end
