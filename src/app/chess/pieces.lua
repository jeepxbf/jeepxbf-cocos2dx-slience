local M = class("pieces")

function M:ctor(row,column,thisid,idx)
    self.idx = idx
    self.row = row
    self.column = column
    self.thisid = thisid
    self.visitFlag = false
end

return M
