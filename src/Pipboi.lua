-- src/Pipboi

local Object = require "lib.classic"
local Pipboi = Object:extend()


function Pipboi:new(x, y)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage("assets/pipboi.png")
    self.speed = 300
    self.targetX = love.graphics.getWidth() - self.image:getWidth() * 0.2 -- Right side of the screen minus image width
    self.direction = 1 -- 1 = right, -1 = left
end

function Pipboi:update(dt)

    self.x = self.x + self.speed * self.direction * dt

    -- Switch direction if past target or start
    if self.x >= self.targetX then
        self.x = self.targetX
        self.direction = -1
    elseif self.x <= 0 then
        self.x = 0
        self.direction = 1
    end
end

function Pipboi:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 0.2, 0.2)
end

return Pipboi
