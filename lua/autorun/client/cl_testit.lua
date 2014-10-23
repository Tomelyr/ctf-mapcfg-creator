AddCSLuaFile()

function File( _mode )
	local mapname = game.GetMap()
	local pretext = "MAP.FriendlyName = '".. mapname .."'; \r\nfunction MAP:SpawnEntities()\r\nif( SERVER ) then\r\n"
	if !file.IsDir("ctf_map_config", "DATA") then 
		file.CreateDir("ctf_map_config")
	end
	file.Write("ctf_map_config/" .. mapname ..".txt", pretext)
	local text = ""
	if _mode == "tf2" then
		for _, ent in pairs(ents.FindByClass("item_teamflag")) do
			local oigin = string.Split( ent.tf["origin"], " ")
			local TFTeam = ""
			if ent.tf["targetname"] == "flag_blue" then
				TFTeam = "TEAM_BLUECTF"
			elseif ent.tf["targetname"] == "flag_red" then
				TFTeam = "TEAM_RED"
			else
				TFTeam = "Baus fucked it up"
			end
		
		text = "self:SpawnFlag( "..TFTeam..", Vector( "..oigin[1]..","..oigin[2]..","..oigin[3].." ))\r\n"

		file.Append("ctf_map_config/" .. mapname ..".txt", text)
		end
	elseif _mode == "ut99" then
		for _, ent in pairs(ents.FindByClass("ut99_flag_blue")) do
			local pos = tostring(ent:GetPos())
			local oigin = string.Split( pos, " ")
			local Team = "TEAM_BLUECTF"
			text = "self:SpawnFlag( "..Team..", Vector( "..oigin[1]..","..oigin[2]..","..oigin[3].." ))\r\n"

			file.Append("ctf_map_config/" .. mapname ..".txt", text)
		end
		for _, ent in pairs(ents.FindByClass("ut99_flag_red")) do
			local pos = tostring(ent:GetPos())
			local oigin = string.Split( pos, " ")
			local Team = "TEAM_RED"
			text = "self:SpawnFlag( "..Team..", Vector( "..oigin[1]..","..oigin[2]..","..oigin[3].." ))\r\n"

			file.Append("ctf_map_config/" .. mapname ..".txt", text)
		end
	else
		print("Tomelyr did some shit that shouldn't happend")
	end
	file.Append("ctf_map_config/" .. mapname ..".txt", "end\r\nend")
end
function Check()
	local mode = ""
	-- TF2
	if table.Count(ents.FindByClass("item_teamflag")) > 1 then
		mode = "tf2"
	end
	-- UT99
	if table.Count(ents.FindByClass("ut99_flag_blue")) > 0 and table.Count(ents.FindByClass("ut99_flag_red")) > 0 then
		mode = "ut99"
	end
	File(mode)
end

concommand.Add( "build_ctf", Check)