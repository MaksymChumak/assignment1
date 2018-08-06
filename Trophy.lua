Trophy = Class{}


function Trophy:init(trophy)

    self.image = love.graphics.newImage(trophy)

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = (VIRTUAL_WIDTH / 2) - (self.width / 2)
    self.y = 180
end

function Trophy:render(trophy)
    love.graphics.draw(self.image , self.x, self.y)
end