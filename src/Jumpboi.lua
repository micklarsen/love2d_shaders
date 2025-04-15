-- src/jumpboi

local Object = require "lib.classic"
local Jumpboi = Object:extend()

function Jumpboi:new(x, y)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage("assets/jump.png")
    local width = self.image:getWidth()
    local height = self.image:getHeight()
    self.frames = {}

    local frame_width = 117
    local frame_height = 233

    for i=0,4 do
        table.insert(self.frames, love.graphics.newQuad(i * frame_width, 0, frame_width, frame_height, width, height))
    end

    self.currentFrame = 1
end


function Jumpboi:update(dt)
    self.currentFrame = self.currentFrame + 10 * dt
    if self.currentFrame >= 6 then
        self.currentFrame = 1
    end
end


function Jumpboi:draw()
    love.graphics.draw(self.image, self.frames[math.floor(self.currentFrame)], self.x, self.y)
end

return Jumpboi