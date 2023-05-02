abc.interface.scenes_gui_update = function ()
Image.SetProperties("object_frame_lime", { ImageFile = _SourceFolder..abc.theme.style_scenes, Visible = false, });
	for object_number = 1, 16 do Paragraph.SetProperties("object_scene_"..object_number, { Text = "", Visible = false, BorderColor = abc.color.lime, }); end
local gui_line = 110;
local scene_index = 0;
Paragraph.SetProperties("gui_scenes_line", { Height = (gui_line+100), BGColor = abc.color.lime, });
Paragraph.SetProperties("gui_scenes_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["SCENES"], BorderColor = abc.color.lime, BGColor = abc.color.title_back, ColorDisabled = abc.color.black, });
	if global_project_title ~= nil then
	Paragraph.SetEnabled("button_scene_new", true);
	Paragraph.SetEnabled("button_scenes_manager", false);
	else
	Paragraph.SetEnabled("button_scene_new", false);
	Paragraph.SetEnabled("button_scenes_manager", false);
	end
local scenes_table = XML.GetElementNames("root/project/scenes", false, false);
	if scenes_table == nil then scenes_table = {}; end
	for scene_number, scene_name in pairs (scenes_table) do
		if XML.GetAttribute("root/project/scenes/"..scene_name, "show_status") ~= "HIDDEN" then
		gui_line = (gui_line+50);
		scene_index = scene_index + 1;
		local scene_title = XML.GetAttribute("root/project/scenes/"..scene_name, "scene_title");
		scene_title = Crypto.BlowfishDecryptString(scene_title, global_safety_key);
		scene_title = abc.tool.link_to_name(scene_title);
			if global_settings_scale_gui == "TRUE" then length_string = String.Length(scene_title);
				if length_string > 36 then length_string = (length_string*4.2); if length_string > 180 then length_string = 180; end else length_string = 140; end
			else length_string = 140; end
		Paragraph.SetProperties("object_scene_"..scene_index, { Width = length_string, Text = scene_title, Visible = true, BorderColor = abc.color.lime, });
		Paragraph.SetProperties("gui_scenes_line", { Height = (gui_line+100), });
		Page.SetObjectScript("object_scene_"..scene_index, "On Click", "abc.interface.scenes_gui_click(\""..scene_name.."\");");
		end--if
		if scene_index == 16 then break end
	end--for
end--function