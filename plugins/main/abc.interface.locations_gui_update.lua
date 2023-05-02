abc.interface.locations_gui_update = function ()
Image.SetProperties("object_frame_aqua", { ImageFile = _SourceFolder..abc.theme.style_locations, Visible = false, });
	for object_number = 1, 16 do Paragraph.SetProperties("object_location_"..object_number, { Text = "", Visible = false, BorderColor = abc.color.aqua, }); end
local gui_line = 110;
local location_index = 0;
Paragraph.SetProperties("gui_locations_line", { Height = (gui_line+100), BGColor = abc.color.aqua, });
Paragraph.SetProperties("gui_locations_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["LOCATIONS"], BorderColor = abc.color.aqua, BGColor = abc.color.title_back, ColorDisabled = abc.color.black, });
	if global_project_title ~= nil then
	Paragraph.SetEnabled("button_locations_new", true);
	Paragraph.SetEnabled("button_locations_manager", true);
	else
	Paragraph.SetEnabled("button_locations_new", false);
	Paragraph.SetEnabled("button_locations_manager", false);
	end
local locations_table = XML.GetElementNames("root/project/locations", false, false);
	if locations_table == nil then locations_table = {}; end
	for location_number, location_tech_name in pairs (locations_table) do
		if XML.GetAttribute("root/project/locations/"..location_tech_name, "show_status") ~= "HIDDEN" then
		location_index = location_index + 1;
		gui_line = (gui_line+50);
		local location_title = XML.GetAttribute("root/project/locations/"..location_tech_name, "location_title");
		location_title = Crypto.BlowfishDecryptString(location_title, global_safety_key);
		local location_prefix = XML.GetAttribute("root/project/locations/"..location_tech_name, "prefix_text");
			if location_prefix ~= "" then location_title = location_prefix.." "..location_title; end
			if global_settings_scale_gui == "TRUE" then length_string = String.Length(location_title);
				if length_string > 36 then length_string = (length_string*4.2); if length_string > 180 then length_string = 180; end else length_string = 140; end
			else length_string = 140; end
		Paragraph.SetProperties("object_location_"..location_index, { Width = length_string, Text = location_title, Visible = true, BorderColor = abc.color.aqua, });
		Paragraph.SetProperties("gui_locations_line", { Height = (gui_line+100), });
		Page.SetObjectScript("object_location_"..location_index, "On Click", "abc.interface.locations_gui_click(\""..location_tech_name.."\");");
		end
		if location_index == 16 then break end
	end--for
end--function