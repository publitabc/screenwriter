abc.interface.scene_workspace_update = function ()
local page_size = Page.GetSize();
	if global_setting_scene_gui == "CLASSIC" then
	local_speech_size = (page_size.Width-500);
	Image.SetVisible("object_frame_paper", false);
	elseif global_setting_scene_gui == "SMALL" then
	--local_speech_size = 670;
	--Image.SetProperties("object_frame_paper", { X = ((page_size.Width/2)-(local_speech_size/2)-40), Height = page_size.Height, Visible = true, });
	local_speech_size = 760;
	Image.SetProperties("object_frame_paper", { X = ((page_size.Width/2)-((local_speech_size+40)/2)), Height = page_size.Height, Visible = true, });
	end
Paragraph.SetPos("gui_scene_title", (page_size.Width-240), 10);
Paragraph.SetPos("gui_scene_help", (page_size.Width-240+200+1), 11);
Input.SetPos("input_scene_title", (page_size.Width-240+1), 41);
Paragraph.SetPos("gui_story_sub", (page_size.Width-240), 70);
Paragraph.SetPos("gui_story_main", (page_size.Width-240+1), 100);
Paragraph.SetPos("gui_menu_title", (page_size.Width-240), 300);
Paragraph.SetPos("gui_menu_field", (page_size.Width-240), 330);
Paragraph.SetPos("button_voiceover", (page_size.Width-230), 340);
Image.SetPos("shadow_button_voiceover", (page_size.Width-232), 340);
Paragraph.SetPos("button_prefix", (page_size.Width-120), 340);
Image.SetPos("shadow_button_remove_voiceover", (page_size.Width-122), 340);
Paragraph.SetPos("button_gui_style", (page_size.Width-230), 380);
Image.SetPos("shadow_button_gui_style", (page_size.Width-232), 380);
Paragraph.SetPos("button_text_align", (page_size.Width-120), 380);
Image.SetPos("shadow_button_text_align", (page_size.Width-122), 380);
Paragraph.SetPos("button_scene_time", (page_size.Width-230), 420);
Image.SetPos("shadow_button_scene_time", (page_size.Width-232), 420);
Paragraph.SetPos("button_change_color", (page_size.Width-120), 420);
Image.SetPos("shadow_button_change_color", (page_size.Width-122), 420);
Paragraph.SetPos("button_backup", (page_size.Width-230), 460);
Image.SetPos("shadow_button_backup", (page_size.Width-232), 460);
Paragraph.SetPos("button_split_scene", (page_size.Width-120), 460);
Image.SetPos("shadow_button_split_scene", (page_size.Width-122), 460);
Paragraph.SetPos("button_hide", (page_size.Width-230), 500);
Image.SetPos("shadow_button_hide", (page_size.Width-232), 500);
Paragraph.SetPos("button_completed", (page_size.Width-120), 500);
Image.SetPos("shadow_button_completed", (page_size.Width-122), 500);
Paragraph.SetPos("button_save", (page_size.Width-230), 540);
Image.SetPos("shadow_button_save", (page_size.Width-232), 540);
Paragraph.SetPos("button_close", (page_size.Width-120), 540);
Image.SetPos("shadow_button_close", (page_size.Width-122), 540);
Paragraph.SetPos("gui_scene_tech_name", (page_size.Width-240), 590);
Paragraph.SetPos("gui_scene_warning", (page_size.Width-240+1), 619);
Paragraph.SetPos("gui_scene_name_info", (page_size.Width-240), 650);
Input.SetPos("input_scene_tech_name", (page_size.Width-240+2), 620);
local objects_table = Page.EnumerateObjects();
	for object_number, object_name in pairs (objects_table) do
		if String.Find(object_name, "speech", 1, false) ~= -1 then
			if Page.GetObjectType(object_name) == 2 then
			Paragraph.SetProperties(object_name, { Width = local_speech_size, X = ((page_size.Width/2)-(local_speech_size/2)), });
			elseif Page.GetObjectType(object_name) == 7 then
			Input.SetProperties(object_name, { Width = (local_speech_size-2), X = ((page_size.Width/2)-(local_speech_size/2)+1), });
			end
		end
	end
Page.Redraw();
end--function