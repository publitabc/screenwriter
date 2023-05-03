abc.interface.gui_lmanager_init = function ()
global_window_width = Page.GetSize().Width;
local objects_table = Page.EnumerateObjects();
	for object_number, object_name in pairs (objects_table) do
		if String.Find(object_name, "button", 1, false) ~= -1 then Paragraph.SetProperties(object_name, { FontScript = global_settings_charset, BorderColor = abc.color.blue, BGColor = abc.color.button_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
		Page.SetObjectScript(object_name, "On Enter", "local button_prop = Paragraph.GetProperties(\""..object_name.."\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
		Page.SetObjectScript(object_name, "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
		end--if
	end--for
Input.SetProperties("input_text_editor", { FontScript = global_settings_charset, FontColor = abc.color.white, BackgroundColor = abc.color.teal, });
Paragraph.SetProperties("gui_menu_title", { BGColor = abc.color.blue, });
Paragraph.SetProperties("menu_button_back", { Text = "[<] "..abc.language[global_settings_language]["BUTTON_BACK"], });
Paragraph.SetProperties("button_new_location", { Text = "[L] "..abc.language[global_settings_language]["BUTTON_NEW_LOCATION"], });
Paragraph.SetText("button_edit", "[E] "..abc.language[global_settings_language]["BUTTON_EDIT"].." ...");
Image.SetProperties("object_frame_blue", { ImageFile = _SourceFolder..abc.theme.style_menu, });
Image.SetProperties("image_location_border", { ImageFile = _SourceFolder..abc.theme.style_white, });
Paragraph.SetProperties("gui_main_frame", { BGColor = abc.color.list_back, });
Paragraph.SetText("button_hidden", abc.language[global_settings_language]["BUTTON_HIDDEN_ELEMENTS"].." ...");
positions_table = {};
	for _number = 1, 1111 do positions_table[_number] = { 0, "", }; end
local locations_table_all = XML.GetElementNames("root/project/locations", true, false);
	if locations_table_all == nil then locations_table_all = {}; end
	local locations_visible_count = 0;
	locations_table = {};
	for _n, location_path in pairs (locations_table_all) do
		if XML.GetAttribute(location_path, "show_status") ~= "HIDDEN" then
		locations_visible_count = (locations_visible_count+1);
		locations_table[locations_visible_count] = locations_table_all[_n];
		end--if
	end--for
	if local_location_index == nil then local_location_index = 1; end
local_locations_count = Table.Count(locations_table);
	if (local_location_index+10) > local_locations_count then
	local_location_index = (local_location_index-1);
		if local_location_index < 1 then local_location_index = 1; end
	end
	if local_locations_count <= 10 then local_locations_max = (local_locations_count-1); else local_locations_max = 10; end--если локаций меньше 11
end--function