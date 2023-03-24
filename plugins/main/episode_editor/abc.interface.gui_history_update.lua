abc.interface.gui_history_update = function ()
global_window_width = Page.GetSize().Width;
global_window_height = Page.GetSize().Height;
local_scene_lenght = (150/(global_system_width/global_window_width));
	if global_window_width_recent == nil then global_window_width_recent = global_window_width; end
Paragraph.SetProperties("menu_episode_description", { Width = ( global_window_width - 810 - 10 ), });--20 border, 720 default pos, 10 border indent
Input.SetProperties("input_episode_description", { Width = ( global_window_width - 810 - 12 ), });--20 border, 721 default pos, 12 border indent
local locations_count = XML.Count("root/project/episodes/episode:"..global_episode_number, "*");
	location_field_y = 120; location_field_height = 80; location_font_size = (42-locations_count);
	if global_settings_scale_gui == "TRUE" then if locations_count > 6 then location_field_height = Math.Round(((global_window_height-location_field_y)/locations_count), 0); end end
	if location_field_height < 28 then location_field_height = 28; end
	if location_font_size < 9 then location_font_size = 9; end
	for location_number = 1, locations_count do
	Paragraph.SetProperties("field_location_"..location_number, { FontSize = location_font_size, Y = location_field_y, Width = global_window_width, Height = location_field_height, });
	location_field_y = (location_field_y+location_field_height);
	end
local objects_table = Page.EnumerateObjects();
	for object_number, object_name in pairs (objects_table) do
		if String.Find(object_name, "_field_scene_", 1, false) ~= -1 then
		local location_number_end = String.Find(object_name, "_", 1, false);
		local location_number = String.Mid(object_name, 1, (location_number_end-1));
		local location_properties = Paragraph.GetProperties("field_location_"..location_number);
		local object_position = Paragraph.GetPos(object_name);
		object_position.X = (object_position.X/(global_window_width_recent/global_window_width));
		Paragraph.SetProperties(object_name, { Width = local_scene_lenght, Height = location_properties.Height, X = object_position.X, Y = location_properties.Y, });
		end--if
	end--for
global_window_width_recent = global_window_width;
end--function