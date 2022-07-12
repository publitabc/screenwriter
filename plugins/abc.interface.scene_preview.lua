abc.interface.scene_preview = function (preview_mode)
local _t = Page.EnumerateObjects();
	if _t ~= nil then for _n, _i in pairs (_t) do if String.Find(_i, "menu_", 1, false) == -1 then Page.DeleteObject(_i); end end end
	if preview_mode == nil then preview_mode = 0; end
local_speech_size = 760;
local page_size = Page.GetSize();
Page.CreateObject(3, "object_frame_paper", { ImageFile = _SourceFolder..abc.theme.style_paper, X = ((page_size.Width/2)-((local_speech_size+40)/2)), Y = 0, Width = 800, Height = page_size.Height, Visible = true, });

	if String.Find(global_scene_path, "/scenes/", 1, false) == -1 then
	local scene_location_path = String.Replace(global_scene_path, "/"..global_scene_name, "", false);
	local location_tech_name = XML.GetAttribute(scene_location_path, "tech_name");
	local_location_title = XML.GetAttribute("root/project/locations/"..location_tech_name, "location_title");
	local_location_title = Crypto.BlowfishDecryptString(local_location_title, global_safety_key);
	else local_location_title = abc.language[global_settings_language]["GUI_UNKNOWN"]; end

local prefix_text = XML.GetAttribute(global_scene_path, "prefix_text");
	if prefix_text == "" then prefix_text = "INT."; end
local time_index = XML.GetAttribute(global_scene_path, "scene_time");
	if time_index == "" then time_index = "1"; end
time_index = String.ToNumber(time_index);
position_y = 10;
Page.CreateObject(2, "gen_heading", { FontScript = global_settings_charset, FontSize = 12, FontName = "Courier New", Text = prefix_text.." "..local_location_title.." - "..abc.scene_time[time_index], X = ((page_size.Width/2)-((local_speech_size-200)/2)), Y = position_y, Width = (local_speech_size-200), Height = 30, BGStyle = preview_mode, BGColor = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, ColorNormal = abc.color.black, ColorDisabled = abc.color.black, Enabled = false, });
position_y = (position_y+40);

local _t = XML.GetElementNames(global_scene_path, true, false);
	for _n, _s in pairs (_t) do
	local character_name = XML.GetAttribute(_s, "character_tech_name");
		if character_name ~= "" then
		local character_role = XML.GetAttribute("root/project/characters/"..character_name, "character_role");
		character_role = Crypto.BlowfishDecryptString(character_role, global_safety_key);
		Page.CreateObject(2, "gen_element_".._n..".1", { FontScript = global_settings_charset, FontSize = 12, FontName = "Courier New", Text = character_role, X = ((page_size.Width/2)-((local_speech_size-200)/2)), Y = position_y, Width = (local_speech_size-200), Height = 30, BGStyle = preview_mode, BGColor = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, ColorNormal = abc.color.black, ColorDisabled = abc.color.black, Enabled = false, Alignment = 1, });
		position_y = (position_y+20);
		local speech_text = XML.GetAttribute(_s, "speech_text");
		speech_text = Crypto.BlowfishDecryptString(speech_text, global_safety_key);
		local object_height = String.Length(speech_text)/1.1;
			if object_height < 30 then object_height = 30; end
			if String.Find(speech_text, "\r\n", 1, false) ~= -1 then object_height = (object_height+20); end
		Page.CreateObject(2, "gen_element_".._n..".2", { FontScript = global_settings_charset, FontSize = 12, FontName = "Courier New", Text = speech_text, X = ((page_size.Width/2)-((local_speech_size-400)/2)), Y = position_y, Width = (local_speech_size-400), Height = object_height, BGStyle = preview_mode, BGColor = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, ColorNormal = abc.color.black, ColorDisabled = abc.color.black, Enabled = false, Alignment = 1, });
		position_y = (position_y+object_height+10);
		else
		local speech_text = XML.GetAttribute(_s, "speech_text");
		speech_text = Crypto.BlowfishDecryptString(speech_text, global_safety_key);
		local object_height = String.Length(speech_text)/1.6;
			if object_height < 30 then object_height = 30; end
		Page.CreateObject(2, "gen_element_".._n..".2", { FontScript = global_settings_charset, FontSize = 12, FontName = "Courier New", Text = speech_text, X = ((page_size.Width/2)-((local_speech_size-200)/2)), Y = position_y, Width = (local_speech_size-200), Height = object_height, BGStyle = preview_mode, BGColor = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, ColorNormal = abc.color.black, ColorDisabled = abc.color.black, Enabled = false, Alignment = 0, });
		position_y = (position_y+object_height+10);
		end--if
	end--for
end--function