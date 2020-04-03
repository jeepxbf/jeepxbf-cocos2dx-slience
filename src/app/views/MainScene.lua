
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    -- add background image
   local mainSprite = display.newSprite("HelloWorld.png")
				      :move(display.center)
				      :addTo(self)
    self:grayNode(mainSprite)
    -- add HelloWorld label
    cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        :move(display.cx, display.cy + 200)
        :addTo(self)
         
end

function MainScene:onEnter()
    local delay = cc.DelayTime:create(0.1)
    local fun = cc.CallFunc:create(function ()
         self:getApp():enterScene("RenderScene")
    end)
    self:runAction(cc.Sequence:create(delay,fun))
end

function MainScene:grayNode(node)
	local program = cc.GLProgramCache:getInstance():getGLProgram("MyGrayShader")
	if not program then
		program = cc.GLProgram:createWithFilenames("grayShader.vert","grayShader.frag")
		cc.GLProgramCache:getInstance():addGLProgram(program,"MyGrayShader")
	end	
	local programState = cc.GLProgramState:getOrCreateWithGLProgram(program)
	programState:setUniformVec4("u_grayParam",cc.vec4(0.2,0.3,0.5,1.0))
	node:setGLProgramState(programState)
end




return MainScene
