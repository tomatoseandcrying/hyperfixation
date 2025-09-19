-- no bitches screen
local drawhook = love.draw
function love.draw()
    drawhook()

    function loadmyimageistg(fn)
        local full_path = (Hyperglobal.path
            .. "assets/customimages/" .. fn)
        local file_data = assert(NFS.newFileData(full_path), ("Epic fail"))
        local tempimagedata = assert(love.image.newImageData(file_data), ("Epic fail 2"))
        --print ("LTFNI: Successfully loaded " .. fn)
        return (assert(love.graphics.newImage(tempimagedata), ("Epic fail 3")))
    end

    local _xscale = love.graphics.getWidth() / 1920
    local _yscale = love.graphics.getHeight() / 1080

    -- debugging ticks & dt & dtcounter
    if Hyperglobal.debug then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print("ticks:" .. Hyperglobal.ticks, 300, 16)
        love.graphics.print("dtcounter:" .. Hyperglobal.dtcounter, 300, 16 + 32)
        love.graphics.print("dt:" .. Hyperglobal.dt, 300, 16 + 64)
    end

    -- no bitches screen
    if G.shobitches and (G.shobitches > 0) then
        if Hyperglobal.nobitches == nil then Hyperglobal.nobitches = loadmyimageistg("nobitchesscreen.png") end
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(Hyperglobal.nobitches, 0 * _xscale * 2, 0 * _yscale * 2, 0, _xscale * 2 * 2, _yscale * 2 * 2)
    end

    -- he's old
    if G.gyahaha then
        if Hyperglobal.gerson == nil then Hyperglobal.gerson = loadmyimageistg("imold.png") end
        local iw, ih = Hyperglobal.gerson:getWidth(), Hyperglobal.gerson:getHeight()
        local x = love.graphics.getWidth() - iw * _xscale
        local y = love.graphics.getHeight() - ih * _yscale
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(Hyperglobal.gerson, x, y, 0, _xscale, _yscale)
    end
end
