-- main

local Pipboi = require "src.Pipboi"
local Jumpboi = require "src.Jumpboi"
local JumpboiMulti = require "src.JumpboiMulti"

local myShader

function love.load()
    pipboi = Pipboi(0, love.graphics.getHeight() / 2)
    jumpboi = Jumpboi(250, 10)
    jumpboiMulti = JumpboiMulti(500, 10)


    local shaderCode = love.filesystem.read("shaders/colorShift.glsl")
    myShader = love.graphics.newShader(shaderCode)
    myShader:send("screenWidth", love.graphics.getWidth())
end

function love.update(dt)
    pipboi:update(dt)
    jumpboi:update(dt)
    jumpboiMulti:update(dt)
end

function love.draw()
    love.graphics.setShader(myShader)
    pipboi:draw()
    love.graphics.setShader()

    jumpboi:draw()
    jumpboiMulti:draw()
end
