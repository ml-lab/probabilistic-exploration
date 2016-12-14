--[[
Copyright (c) 2014 Google Inc.

See LICENSE file for full terms of limited license.
]]

require "nn"
require "image"
require "iterm"

local scale = torch.class('nn.Scale', 'nn.Module')


function scale:__init(height, width)
    self.height = height
    self.width = width
end

function scale:forward(x)
    local x = x
    if x:dim() > 3 then
        x = x[1]
    end

    -- x = image.rgb2y(x)  -- turn it into grayscale (luminance)
    x = image.scale(x, self.width, self.height, 'bilinear')
    -- iterm.image(x)
    return x
end

function scale:updateOutput(input)
    return self:forward(input)
end

function scale:float()
end
