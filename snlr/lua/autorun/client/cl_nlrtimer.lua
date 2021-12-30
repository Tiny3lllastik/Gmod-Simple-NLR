--[[
Created by: Tiny3lastik
--]]


-- CONSTANT NLR Time in Seconds
local NLR_TIME = GetConVar( "nlrtime" )

-- Remaining Time NLR
local remaining_time = 0

local last_time

net.Receive("cl_beginNLRTimer", function()
    remaining_time = NLR_TIME
    last_time = CurTime()
end)

hook.Add("HUDPaint", "NLRTimerDrawHook", function()
    -- If there is still NLR Time remaining, then draw it to the GUI
    if remaining_time ~= 0 then
        draw.DrawText("NLR: "..remaining_time, "NLRTimerFont", ScrW() / 2, 10, color_red, TEXT_ALIGN_CENTER)
        
        -- Check if at least a second elapsed since last draw
        -- If yes then set the last time to the current time and decrease the NLR timer
        if((CurTime() - last_time) > 1.0) then
            last_time = CurTime()
            remaining_time = remaining_time - 1
        end
    end
end)


surface.CreateFont("NLRTimerFont", {
    font = "Abel",
    extended = false,
    size = 25,
    weight = 900,
    
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
})