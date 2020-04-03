--渲染优化

local M = class("RenderScene",cc.load("mvc").ViewBase)

function M:onCreate()
	for i=1,100 do
		local girl = cc.Sprite:create("player/girl.png")
		self:addChild(girl,1)
		girl:setScale(0.2)
		girl:setPosition(cc.p(math.random(1,960),math.random(1,640)))

		local lable = cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        lable:setPosition(cc.p(math.random(1,960),math.random(1,640)))
        self:addChild(lable,2)
	end
end

return M