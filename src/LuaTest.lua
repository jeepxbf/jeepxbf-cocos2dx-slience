--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

local M = class("LuaTest")

function M:test()
    print("打印可写目录路径",cc.FileUtils:getInstance():getWritablePath())

    cc.UserDefault:getInstance():setBoolForKey("_user|zonelist|json",true)
	cc.UserDefault:getInstance():flush();
	local test = cc.UserDefault:getInstance():getBoolForKey("_user|zonelist|json",false)
	print("userDefault 测试 \"竖线不能存在xml中\"",test)

end

--function M:cutImage(imagePath)
--    local oriSprite = cc.Sprite:create("map/map_huashanlunjian.jpg")


--end

--endregion
