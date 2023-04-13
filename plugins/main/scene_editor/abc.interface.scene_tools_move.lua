abc.interface.scene_tools_move = function (object_name, move_mode)
	if move_mode == "UP" then move_mode = 0; elseif move_mode == "DOWN" then move_mode = 1; else return end
local previous_element_name;
local success;
local speech_table = XML.GetElementNames(global_scene_path, false, false);
local speech_count = Table.Count(speech_table);
	if speech_table == nil then speech_table = {}; end
for _n, speech_name in pairs (speech_table) do
	if speech_name == object_name then
		if move_mode == 0 then previous_element_name = speech_table[_n-1];
		elseif move_mode == 1 then previous_element_name = speech_table[_n+1]; end
		if previous_element_name ~= nil then abc.project.save_turn();
		local speech_data = XML.GetElementXML(global_scene_path.."/"..object_name);
		XML.RemoveElement(global_scene_path.."/"..object_name);
		XML.InsertXML(global_scene_path.."/"..previous_element_name, speech_data, move_mode);
			if Application.GetLastError() == 0 then success = true; end
		end--if
	end--if
end--for
return success
end--function