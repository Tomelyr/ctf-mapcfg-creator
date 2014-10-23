AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.PrintName		= "Bouncy Ball"
ENT.Author			= "Garry Newman"
ENT.Information		= "An edible bouncy ball"
ENT.Category		= "Fun + Games"

ENT.Editable		= true
ENT.Spawnable		= true
ENT.AdminOnly		= false
ENT.RenderGroup		= RENDERGROUP_TRANSLUCENT
function ENT:KeyValue(key, value)
	if(!self.tf) then self.tf = {} end
    self.tf[key] = value
end