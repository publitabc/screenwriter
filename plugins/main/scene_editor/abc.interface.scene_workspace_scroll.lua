abc.interface.scene_workspace_scroll = function ()
	if global_speech_name ~= nil then
	local speech_position = Input.GetPos(global_speech_name).Y;
	local page_size = Page.GetSize();
		if speech_position > (page_size.Height/2) then speech_position = speech_position - (page_size.Height/2);
		local objects_table = Page.EnumerateObjects();
			if objects_table == nil then objects_table = {}; end
			for object_number, object_index in pairs (objects_table) do
				if String.Find(object_index, "speech", 1, false) ~= -1 then
					if Page.GetObjectType(object_index) == 7 then--input
					local object_position = Input.GetPos(object_index);
					Input.SetPos(object_index, object_position.X, ( object_position.Y - speech_position ));
					elseif Page.GetObjectType(object_index) == 2 then
					local object_position = Paragraph.GetPos(object_index);
					Paragraph.SetPos(object_index, object_position.X, ( object_position.Y - speech_position ));
					end
				end
			end
		end
	end--if
	if global_speech_name ~= nil then
	Page.SetFocus(global_speech_name);--after redraw
	global_speech_name = nil;
	end--if
end--function