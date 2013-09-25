gstate = require 'hump.gamestate'

dofile 'game/game.lua'

function love.load()
    gstate.registerEvents()
    gstate.switch(game)
end
