abc.interface.gui_history_create = function ()
local local_words_counter = 0;
local locations_table = XML.GetElementNames("root/project/episodes/episode:"..global_episode_number, false, false);
	if locations_table == nil then locations_table = {}; end
local locations_count = Table.Count(locations_table);
location_field_y = 120; location_field_height = 80;
	if locations_count > 10 then global_settings_scale_gui = "TRUE"; end
	if global_settings_scale_gui == "TRUE" then if locations_count > 6 then location_field_height = Math.Round(((global_window_height-location_field_y)/locations_count), 0); end end
	if location_field_height < 28 then location_field_height = 28; end
local scenes_all_count = 0;
location_font_size = (42-locations_count);
	if location_font_size < 9 then location_font_size = 9; end
	for location_number, location_index in pairs (locations_table) do
	local location_tech_name = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number, "tech_name");
	local location_title = XML.GetAttribute("root/project/locations/"..location_tech_name, "location_title");
		if location_title == "" then location_title = location_tech_name;
		location_title = Crypto.BlowfishEncryptString(location_title, global_safety_key, 0);
		XML.SetAttribute("root/project/locations/"..location_tech_name, "location_title", location_title);
		end
	location_title = Crypto.BlowfishDecryptString(location_title, global_safety_key);
	local title_repeat = Math.Round((locations_count/4), 0);
		if title_repeat < 1 then title_repeat = 1; end
	location_title = String.Repeat(" ... "..location_title, title_repeat);
	Page.CreateObject(2, "field_location_"..location_number,    { FontScript = global_settings_charset, Text = location_title, Visible = true, FontSize = location_font_size, FontWeight = 900, Y = location_field_y, Width = global_window_width, Height = location_field_height, BorderColor = abc.color.epi, BGColor = abc.color.aqua, ColorNormal = abc.color.white, ColorHighlight = abc.color.white, ColorDown = abc.color.white, FontName = "Segoe UI", FontAntiAlias = true, BorderStyle = 1, BGStyle = 0, ScrollVertical = 2, ScrollHorizontal = 2, Alignment = 1, });
	Paragraph.SetProperties("field_location_"..location_number, { FontScript = global_settings_charset, Text = location_title, Visible = true, FontSize = location_font_size, FontWeight = 900, Y = location_field_y, Width = global_window_width, Height = location_field_height, BorderColor = abc.color.epi, BGColor = abc.color.aqua, ColorNormal = abc.color.white, ColorHighlight = abc.color.white, ColorDown = abc.color.white, });
	Page.SetObjectScript("field_location_"..location_number, "On Enter", "local_location_index = "..location_number.."; Paragraph.SetProperties(\"field_location_"..location_number.."\", { BGColor = abc.color.teal, });");
	Page.SetObjectScript("field_location_"..location_number, "On Leave", "local_location_index = nil; Paragraph.SetProperties(\"field_location_"..location_number.."\", { BGColor = abc.color.aqua, });");
	Page.SetObjectScript("field_location_"..location_number, "On Right-Click", "abc.interface.popup_history_show("..location_number..");");
	local scenes_table = XML.GetElementNames("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number, false, false);
		if scenes_table == nil then scenes_table = {}; end
		for scene_number, scene_tech_name in pairs (scenes_table) do
		scenes_all_count = scenes_all_count + 1;
		local scene_tech_color = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "tech_color");
		scene_tech_color = Crypto.BlowfishDecryptString(scene_tech_color, global_safety_key);
		local scene_title = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "scene_title");
		scene_title = Crypto.BlowfishDecryptString(scene_title, global_safety_key);
		scene_title = abc.tool.link_to_name(scene_title);
		local completed_status = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "completed_status");
			if completed_status == "COMPLETED" then completed_status = 800; else completed_status = 400; end
		local main_story = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "main_story");
			if main_story ~= "" then
			story_color = XML.GetAttribute("root/project/stories/"..main_story, "story_color");
			story_color = Crypto.BlowfishDecryptString(story_color, global_safety_key);
				if story_color ~= "" then scene_tech_color = story_color; end
			end
		local scene_time_index = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "scene_time");
			if scene_time_index ~= "" then scene_time_index = String.ToNumber(scene_time_index); else scene_time_index = 1; end
		local tech_lenght = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "tech_lenght");
		local_words_counter = (local_words_counter+(String.ToNumber(tech_lenght)/5.8));
		local scene_tech_pos = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "tech_pos");
		scene_tech_pos = String.ToNumber(scene_tech_pos);
		scene_tech_pos = Math.Round((scene_tech_pos/global_width_coef), 0);
		local location_position = Paragraph.GetPos("field_location_"..location_number);
		Page.CreateObject(2, location_number.."_field_scene_"..scenes_all_count, { FontScript = global_settings_charset, FontWeight = completed_status, Text = abc.scene_time[scene_time_index].." "..scene_title, X = scene_tech_pos, Y = location_position.Y, Width = local_scene_lenght, Height = location_field_height, ScrollVertical = 2, BGStyle = 0, BGColor = scene_tech_color, Cursor = 1, TooltipText = scene_title, BorderStyle = 1, BorderColor = abc.color.epi, });
		local local_scene_path = "root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name;
		Page.SetObjectScript(location_number.."_field_scene_"..scenes_all_count, "On Click", "global_scene_name = \""..scene_tech_name.."\"; global_scene_path = \""..local_scene_path.."\"; global_previous_page = \"history\"; Page.Jump(\"scene_editor\");");
		Page.SetObjectScript(location_number.."_field_scene_"..scenes_all_count, "On Enter", "Paragraph.SetProperties(\"field_location_"..location_number.."\", { BGColor = abc.color.teal, }); if global_object_move == nil then global_object_focus = \""..location_number.."_field_scene_"..scenes_all_count.."\"; global_scene_name = \""..scene_tech_name.."\"; global_scene_path = \""..local_scene_path.."\"; end");
		Page.SetObjectScript(location_number.."_field_scene_"..scenes_all_count, "On Leave", "Paragraph.SetProperties(\"field_location_"..location_number.."\", { BGColor = abc.color.aqua, }); if global_object_move == nil then global_object_focus = nil; end");
		end--for
	location_field_y = (location_field_y+location_field_height);
	end--for
Paragraph.SetText("menu_wordscounter", Math.Round(local_words_counter, 0));
end--function