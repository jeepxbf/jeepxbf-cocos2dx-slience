--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
local M = class("Player")

function M:ctor(name)
    self.name = name 
end

function M:createEntity(id)
    self.thisId = id
    
end
--endregion
