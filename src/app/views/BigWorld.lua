-- region *.lua
-- Date
-- 此文件由[BabeLua]插件自动生成

require("app.chess.chessBoard")
local BigWorld = class("MainScene", cc.load("mvc").ViewBase)
function BigWorld:onCreate()
    -- add background image
    -- local mainSprite = display.newSprite("map/map_huashanlunjian.jpg")
    -- :move(display.center)
    -- :addTo(self)
    local mainSprite = cc.Sprite:create("map/map_huashanlunjian.jpg")
    mainSprite:setPosition(display.center)
    -- mainSprite:onEnter()
    self.mainSprite = mainSprite
    self.mainSprite:visit()
    self.mainSprite:retain()
    
    -- self._camera = cc.Camera:createOrthographic(960, 640, 0, 1)
    -- self._camera:setCameraFlag(cc.CameraFlag.USER1)
    -- self:addChild(self._camera)
    -- self._camera:setPosition(cc.p(0,0))
    -- self._camera:setAnchorPoint(cc.p(0,0))
    -- self:setCameraMask(2)

--    local target = cc.vec3(0,0,0)
--    self._camera:lookAt(target)

--    local delay = cc.DelayTime:create(0.1)
--    local call = cc.CallFunc:create(function ()
--        target = target + cc.vec3(1,1,0)
--    end)
--    self:runAction(cc.RepeatForever:create(cc.Sequence:create(call,delay)))
--    self._camera:setScale(2)
--    local move = cc.MoveBy:create(5, cc.p(100, 0));
--    self._camera:runAction(move)

    self.walkState = BigWorld.walkDir.hold
    self:createPlayer()

    local listener = cc.EventListenerKeyboard:create()
    listener:registerScriptHandler(handler(self,self.onKeyBoardPressed), cc.Handler.EVENT_KEYBOARD_PRESSED)
    listener:registerScriptHandler(handler(self,self.onKeyBoardReleased), cc.Handler.EVENT_KEYBOARD_RELEASED)
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self)   
    
    g_ChessBoard:createBoard()
    g_ChessBoard:printChessBoard()
end

BigWorld.walkDir = {
    hold = 0,
    up = 1,
    down = 2,
    left = 3,
    right = 4,
}

function BigWorld:onKeyBoardPressed(keycode,event)
    if keycode == cc.KeyCode.KEY_W then
        self.walkState = BigWorld.walkDir.up
    elseif keycode == cc.KeyCode.KEY_S then
        self.walkState = BigWorld.walkDir.down
    elseif keycode == cc.KeyCode.KEY_A then
        self.walkState = BigWorld.walkDir.left
    elseif keycode == cc.KeyCode.KEY_D then
        self.walkState = BigWorld.walkDir.right  
    end
end

function BigWorld:onKeyBoardReleased(keycode,event)
    self.walkState = BigWorld.walkDir.hold
end

function BigWorld:update(dt)
    -- self.player:visit()
    -- self.oriSprite:visit()
    -- self.playNode:visit()
    self.mainSprite:visit()
    if self.walkState ~= BigWorld.walkDir.hold then
        local s = (2/100)*dt --速度 100ms走2像素
        self:changeDir(self.walkState)
        if self.walkState == BigWorld.walkDir.up then
            self.playNode:setPositionY(self.playNode:getPositionY()+s)
        elseif self.walkState == BigWorld.walkDir.down then
            self.playNode:setPositionY(self.playNode:getPositionY()-s)
        elseif self.walkState == BigWorld.walkDir.right then
            self.playNode:setPositionX(self.playNode:getPositionX()+s)
        elseif self.walkState == BigWorld.walkDir.left then
            self.playNode:setPositionX(self.playNode:getPositionX()-s)
        end
        
    end
end

function BigWorld:changeDir(dir)
    if self.Dir == dir then
        return
    end
end
--addChild 会调用onEnter
--这里想通过不addChild就把图片显示出来
--单纯的显示一张图片可以，但是显示序列帧动画不行 
--lua层的onEnter重写了 onEnter什么也不做 需要在c++层onEnter  不调用onEnter单张图也能显示出来
function BigWorld:createPlayer()
    self.playNode = cc.Node:create()
    local tempNode = cc.Node:create()
    self.playNode:addChild(tempNode)
    self.playNode:retain()
    self.playNode:onEnter()

    local oriSprite = cc.Sprite:create("player/duolaAmeng.png")
    local width = oriSprite:getContentSize().width/4
    local height = oriSprite:getContentSize().height/4
   
    local animation = cc.Animation:create()
    local player = cc.Sprite:create()
    for i = 1,4 do
        local x = (i-1)*width
        local y = 0
        local aniSprite = cc.Sprite:create("player/duolaAmeng.png",cc.rect(x,y,width,height))
        animation:addSpriteFrame(aniSprite:getSpriteFrame())
        animation:setDelayPerUnit(0.25)
        animation:setRestoreOriginalFrame(true)
    end

    local action = cc.Animate:create(animation)
    local RepeatAction = cc.RepeatForever:create(action)
    player:runAction(RepeatAction)
    tempNode:addChild(player)
    self:addChild(self.playNode)
    self.playNode:setPosition(display.center)
    self.playNode:visit()
end

return BigWorld
-- endregion
