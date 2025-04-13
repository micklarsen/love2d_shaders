-- main

local Pipboi = require "src.Pipboi"

local myShader

function love.load()
    pipboi = Pipboi(0, love.graphics.getHeight() / 2)

    local shaderCode = love.filesystem.read("shaders/colorShift.glsl")
    myShader = love.graphics.newShader(shaderCode)
    myShader:send("screenWidth", love.graphics.getWidth())
end

function love.update(dt)
    pipboi:update(dt)
end

function love.draw()
    love.graphics.setShader(myShader)
    pipboi:draw()
    love.graphics.setShader()
end
