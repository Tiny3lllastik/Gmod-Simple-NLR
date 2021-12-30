--[[
Created by: Tiny3lastik
--]]



hook.Add("Initialize", "BeginNLRTimer", function(victim, inflictor, attacker)
CreateConVar( "nlrtime", 180, FCVAR_SERVER_CAN_EXECUTE )
end)

util.AddNetworkString("cl_beginNLRTimer")


hook.Add("PlayerDeath", "BeginNLRTimer", function(victim, inflictor, attacker)
    net.Start("cl_beginNLRTimer")
    net.Send(victim)
end)