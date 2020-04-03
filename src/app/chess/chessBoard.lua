local Pieces = require("app.chess.pieces")
local M = class("chessBoard")

function M:ctor()
    self.maxRow = 10
    self.maxColumn = 10
    self.piecesList = {}
end

function M:createBoard()
    for i = 1,self.maxRow do
        if not self.piecesList[i] then
            self.piecesList[i] = {}  --行列表
        end
        for j = 1,self.maxColumn do
            local pieces = Pieces:create(i,j,math.random(1,10),(i-1)*self.maxColumn+j)
            table.insert(self.piecesList[i],pieces)
        end
    end
end

function M:printChessBoard()
    local t = {}
    for i,v in ipairs(self.piecesList) do
        for j,k in ipairs(v) do
            table.insert(t,k.thisid)
        end
    end
--使用concat可以控制对齐
    local j = 1
    for i = 1,self.maxRow do
        local chess = table.concat(t,"	",j,j+self.maxColumn-1)
        j = j + self.maxColumn
        print(chess)
    end
end

function M:fillSameItemList()
    local row = 1
    local column = 1

    local rowTempList = {}
    local columnTempList = {}
    --按行扫描
    for i = 1,self.maxRow do
               
    end

    for i, v in ipairs(self.pieces) do
        
    end
end

cc.exports.g_ChessBoard = g_ChessBoard or M.new()