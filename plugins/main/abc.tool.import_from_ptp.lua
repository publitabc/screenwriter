abc.tool.import_from_ptp = function (file_path)
local attributes_table = { "location_title", "location_description", "tech_color", "scene_title", "story_title", "story_text", "story_color", "speech_text", "character_name", "character_role", "role_notice", "character_profile", "character_info", "tech_name", "episode_title", "episode_description", };
local file_name = abc.tool.fragment_name_generator();
Crypto.BlowfishDecrypt(file_path, _TempFolder.."\\"..file_name, "abc");
local data_table = TextFile.ReadToTable(_TempFolder.."\\"..file_name);
File.Delete(_TempFolder.."\\"..file_name, false, false, false, nil);
local items_count = Table.Count(data_table);
local local_safety_key = data_table[1];

for item_number = 2, items_count, 3 do
local insert_data = Crypto.BlowfishDecryptString(data_table[item_number+2], "abc");

if data_table[item_number] == "EPISODE" then item_check = nil;--стирать переменную чтобы результаты прошлого импорта не сработали
local episodes_table = XML.GetElementNames("root/project/episodes", true, true);
	if episodes_table == nil then episodes_table = {}; end
data_table[item_number+1] = Crypto.BlowfishDecryptString(data_table[item_number+1], local_safety_key);
	for episode_number, episode_path in pairs (episodes_table) do
	local episode_tech_name = XML.GetAttribute(episode_path, "tech_name");
	episode_tech_name = Crypto.BlowfishDecryptString(episode_tech_name, global_safety_key);
		if data_table[item_number+1] == episode_tech_name then
			if abc.settings.import_overwrite == "TRUE" then
			item_check = episode_number; else item_check = "CANCELED";--номер эпизода у которого название такое же как и у импортного эпизода для замены старого на новый
			end--if
		end--if
	end--for episodes
	if item_check == nil then item_check = 1 + XML.Count("root/project/episodes", "*"); end
	if item_check ~= "CANCELED" then
	XML.SetValue("root/project/episodes/episode:"..item_check, "", false);
	XML.InsertXML("root/project/episodes/episode:"..item_check, insert_data, 2);
		for attribute_number, attribute_name in pairs (attributes_table) do
		local redata = XML.GetAttribute("root/project/episodes/episode:"..item_check, attribute_name);
			if redata ~= "" then
			redata = Crypto.BlowfishDecryptString(redata, local_safety_key);
			redata = Crypto.BlowfishEncryptString(redata, global_safety_key, 0);
			XML.SetAttribute("root/project/episodes/episode:"..item_check, attribute_name, redata);
			end--if
		end--for
	local locations_table = XML.GetElementNames("root/project/episodes/episode:"..item_check, true, true);
		if locations_table == nil then locations_table = {}; end
		for location_number, location_path in pairs (locations_table) do
		local scenes_table = XML.GetElementNames(location_path, true, false);
			if scenes_table == nil then scenes_table = {}; end
			for scene_number, scene_path in pairs (scenes_table) do
				for attribute_number, attribute_name in pairs (attributes_table) do
				local redata = XML.GetAttribute(scene_path, attribute_name);
					if redata ~= "" then
					redata = Crypto.BlowfishDecryptString(redata, local_safety_key);
					redata = Crypto.BlowfishEncryptString(redata, global_safety_key, 0);
					XML.SetAttribute(scene_path, attribute_name, redata);
					end--if
				end--for
			local speeches_table = XML.GetElementNames(scene_path, true, false);
				if speeches_table == nil then speeches_table = {}; end
				for speech_number, speech_path in pairs(speeches_table) do
					for attribute_number, attribute_name in pairs (attributes_table) do
					local redata = XML.GetAttribute(speech_path, attribute_name);
						if redata ~= "" then
						redata = Crypto.BlowfishDecryptString(redata, local_safety_key);
						redata = Crypto.BlowfishEncryptString(redata, global_safety_key, 0);
						XML.SetAttribute(speech_path, attribute_name, redata);
						end--if
					end--for
				end--for speeches
			end--for scenes
		end--for locations
	end--if
elseif data_table[item_number] == "SCENE" then scene_path_finaly = nil;--стирать переменную чтобы результаты прошлого импорта не сработали
--поиск сцены в проекте по названию
local episodes_table = XML.GetElementNames("root/project/episodes", true, true);
	if episodes_table == nil then episodes_table = {}; end
	for episode_number, episode_path in pairs (episodes_table) do
	local locations_table = XML.GetElementNames(episode_path, true, true);
		if locations_table == nil then locations_table = {}; end
		for location_number, location_path in pairs (locations_table) do
		local scenes_table = XML.GetElementNames(location_path, false, false);
			if scenes_table == nil then scenes_table = {}; end
			for scene_number, scene_name in pairs (scenes_table) do
				if data_table[item_number+1] == scene_name then
					if abc.settings.import_overwrite == "TRUE" then
					scene_path_finaly = location_path.."/"..scene_name; else scene_path_finaly = "CANCELED";
					end--if
				end--if
			end--for scenes
		end--for locations
	end--for episodes
--поиск сцены в хранилище сцен по названию
local scene_title = XML.GetAttribute("root/project/scenes/"..data_table[item_number+1], "scene_title");
	if scene_title ~= "" then
		if abc.settings.import_overwrite == "TRUE" then
		scene_path_finaly = "root/project/scenes/"..data_table[item_number+1]; else scene_path_finaly = "CANCELED";
		end--if
	end
	if scene_path_finaly == nil then scene_path_finaly = "root/project/scenes/"..data_table[item_number+1]; end
--если замена подтверждена, её перезаписывают по адресу scene_path_finaly
	if scene_path_finaly ~= "CANCELED" then
	XML.SetValue(scene_path_finaly, "", false);
	XML.InsertXML(scene_path_finaly, insert_data, 2);
		for attribute_number, attribute_name in pairs (attributes_table) do
		local redata = XML.GetAttribute(scene_path_finaly, attribute_name);
			if redata ~= "" then
			redata = Crypto.BlowfishDecryptString(redata, local_safety_key);
			redata = Crypto.BlowfishEncryptString(redata, global_safety_key, 0);
			XML.SetAttribute(scene_path_finaly, attribute_name, redata);
			end--if
		end--for
	local speeches_table = XML.GetElementNames(scene_path_finaly, true, false);
		if speeches_table == nil then speeches_table = {}; end
		for speech_number, speech_path in pairs(speeches_table) do
			for attribute_number, attribute_name in pairs (attributes_table) do
			local redata = XML.GetAttribute(speech_path, attribute_name);
				if redata ~= "" then
				redata = Crypto.BlowfishDecryptString(redata, local_safety_key);
				redata = Crypto.BlowfishEncryptString(redata, global_safety_key, 0);
				XML.SetAttribute(speech_path, attribute_name, redata);
				end--if
			end--for
		end--for speeches
	end--if
elseif data_table[item_number] == "LOCATION" then local element_path_finaly = "root/project/locations/"..data_table[item_number+1];
	if XML.GetAttribute(element_path_finaly, "location_title") ~= "" then
		if abc.settings.import_overwrite == "FALSE" then
		element_path_finaly = "CANCELED";
		end--if
	end
	if element_path_finaly ~= "CANCELED" then
	XML.SetValue(element_path_finaly, "", false);
	XML.InsertXML(element_path_finaly, insert_data, 2);
		for attribute_number, attribute_name in pairs (attributes_table) do
		local redata = XML.GetAttribute(element_path_finaly, attribute_name);
			if redata ~= "" then
			redata = Crypto.BlowfishDecryptString(redata, local_safety_key);
			redata = Crypto.BlowfishEncryptString(redata, global_safety_key, 0);
			XML.SetAttribute(element_path_finaly, attribute_name, redata);
			end--if
		end--for
	end
elseif data_table[item_number] == "CHARACTER" then local element_path_finaly = "root/project/characters/"..data_table[item_number+1];
	if XML.GetAttribute(element_path_finaly, "character_role") ~= "" then
		if abc.settings.import_overwrite == "FALSE" then
		element_path_finaly = "CANCELED";
		end--if
	end
	if element_path_finaly ~= "CANCELED" then
	XML.SetValue(element_path_finaly, "", false);
	XML.InsertXML(element_path_finaly, insert_data, 2);
		for attribute_number, attribute_name in pairs (attributes_table) do
		local redata = XML.GetAttribute(element_path_finaly, attribute_name);
			if redata ~= "" then
			redata = Crypto.BlowfishDecryptString(redata, local_safety_key);
			redata = Crypto.BlowfishEncryptString(redata, global_safety_key, 0);
			XML.SetAttribute(element_path_finaly, attribute_name, redata);
			end--if
		end--for
	end
elseif data_table[item_number] == "STORY" then local element_path_finaly = "root/project/stories/"..data_table[item_number+1];
	if XML.GetAttribute(element_path_finaly, "story_title") ~= "" then
		if abc.settings.import_overwrite == "FALSE" then
		element_path_finaly = "CANCELED";
		end--if
	end
	if element_path_finaly ~= "CANCELED" then
	XML.SetValue(element_path_finaly, "", false);
	XML.InsertXML(element_path_finaly, insert_data, 2);
		for attribute_number, attribute_name in pairs (attributes_table) do
		local redata = XML.GetAttribute(element_path_finaly, attribute_name);
			if redata ~= "" then
			redata = Crypto.BlowfishDecryptString(redata, local_safety_key);
			redata = Crypto.BlowfishEncryptString(redata, global_safety_key, 0);
			XML.SetAttribute(element_path_finaly, attribute_name, redata);
			end--if
		end--for
	end
end
	if (item_number+3) == items_count then break end
end

scene_path_finaly = nil;
end--function