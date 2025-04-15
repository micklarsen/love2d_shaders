-- src/JumpboiMulti

local Object = require "lib.classic"
local Jumpboi = Object:extend()

function Jumpboi:new(x, y)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage("assets/jump_3.png")
    local width = self.image:getWidth()
    local height = self.image:getHeight()

    self.frames = {}

    local frame_width = 117
    local frame_height = 233

    -- We have an image with two rows of animation frames so we need a nested for-loop
    -- We have a 2px bleeding we can adjust when creating the quads
    local maxFrames = 5
    for i = 0, 1 do
        for j = 0,2 do
            table.insert(self.frames, love.graphics.newQuad(1 + j * (frame_width + 2), 1 + i * (frame_height + 2), frame_width, frame_height, width, height))
            if #self.frames == maxFrames then
                break
            end
        end
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