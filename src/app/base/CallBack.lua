--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
--c++ 回调lua的全局函数

cc.exports.Update_All = function ()
    local runScene = display.getRunningScene()
    if runScene then
        local curScene = runScene:getChildByName("BigWorld")
        if curScene then
            curScene:update(g_LuaUpdateDt)
        end
    end
end


--endregion
