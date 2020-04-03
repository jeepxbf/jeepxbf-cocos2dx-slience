
cc.FileUtils:getInstance():setPopupNotify(false)

cc.FileUtils:getInstance():addSearchPath("src/shader/")
cc.FileUtils:getInstance():addSearchPath("data/")

require "config"
require "cocos.init"

__require = require

function require(filename)
    local state,ret = xpcall(function (...)
        return __require(filename)
    end,function (err)
        print(err)
        return nil
    end)
    return ret;
end

require "LuaTest"
require "app.base.CallBack"

local function main()	
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
