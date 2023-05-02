abc.interface.episodes_gui_update = function ()
Image.SetProperties("object_frame_epi", { ImageFile = _SourceFolder..abc.theme.style_episodes, Visible = false, });
	for object_number = 1, 16 do Paragraph.SetProperties("object_episode_"..object_number, { Text = "", Visible = false, BorderColor = abc.color.lime, }); end
local gui_line = 80;
Paragraph.SetProperties("gui_episodes_line", { Height = (gui_line+100), BGColor = abc.color.epi, });
Paragraph.SetProperties("gui_episodes_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["EPISODES"], BorderColor = abc.color.epi, BGColor = abc.color.title_back, ColorDisabled = abc.color.black, });
local episodes_count = XML.Count("root/project/episodes", "episode");
	if episodes_count == 16 then
	Paragraph.SetEnabled("button_episodes_new", false);
	else
		if global_project_title ~= nil then
		Paragraph.SetEnabled("button_episodes_new", true);
		else
		Paragraph.SetEnabled("button_episodes_new", false);
		end
	end
	if episodes_count ~= 0 then
		for episode_number = 1, episodes_count do gui_line = gui_line + 50; local speeches_count = 0;
		local episode_title = XML.GetAttribute("root/project/episodes/episode:"..episode_number, "episode_title");
		episode_title = Crypto.BlowfishDecryptString(episode_title, global_safety_key);
			if global_settings_percentage_completed == "TRUE" then
			local locations_table = XML.GetElementNames("root/project/episodes/episode:"..episode_number, true, true);
				if locations_table == nil then locations_table = {}; end
				for location_number, location_path in pairs (locations_table) do
				local scenes_table = XML.GetElementNames(location_path, true, true);
					if scenes_table == nil then scenes_table = {}; end
					for scene_number, scene_path in pairs (scenes_table) do
					speeches_count = speeches_count + XML.Count(scene_path, "*");
					end--for
				end--for
			local complete_percentage = Math.Round((((speeches_count/abc.dialogs_per_page[global_settings_dialogs_per_page])*100)/global_project_time), 0);
			episode_title = "["..complete_percentage.."%] "..episode_title;
			end
			if global_settings_scale_gui == "TRUE" then length_string = String.Length(episode_title);
				if length_string > 36 then length_string = (length_string*4.2); if length_string > 180 then length_string = 180; end else length_string = 140; end
			else length_string = 140; end
		Paragraph.SetProperties("object_episode_"..episode_number, { Width = length_string, Text = episode_title, Visible = true, BorderColor = abc.color.epi, });
		Paragraph.SetProperties("gui_episodes_line", { Height = (gui_line+100), });
		Page.SetObjectScript("object_episode_"..episode_number, "On Click", "global_episode_number = "..episode_number.."; Page.Jump(\"history\");");
		end--for
	end--if
end--function