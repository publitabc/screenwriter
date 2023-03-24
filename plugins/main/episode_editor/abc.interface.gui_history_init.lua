abc.interface.gui_history_init = function ()
global_window_width = Page.GetSize().Width;
global_window_height = Page.GetSize().Height;
local_scene_lenght = (150/(global_system_width/global_window_width));
global_width_coef = (global_system_width/global_window_width);
Image.SetProperties("object_frame_epi", { ImageFile = _SourceFolder..abc.theme.style_episodes, });
Image.SetProperties("object_frame_blue", { ImageFile = _SourceFolder..abc.theme.style_menu, });
local episode_title = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number, "episode_title");
episode_title = Crypto.BlowfishDecryptString(episode_title, global_safety_key);
Input.SetProperties("input_episode_title", { FontScript = global_settings_charset, Text = episode_title, FontColor = abc.color.black, BackgroundColor = abc.color.input_back, });
Paragraph.SetProperties("menu_episode_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["EPISODE_TITLE"]..":", BGColor = abc.color.epi, ColorDisabled = abc.color.black, });
local episode_description = XML.GetAttribute("root/project/episodes/episode:"..global_episode_number, "episode_description");
episode_description = Crypto.BlowfishDecryptString(episode_description, global_safety_key);
Input.SetProperties("input_episode_description", { FontScript = global_settings_charset, Text = episode_description, FontColor = abc.color.black, BackgroundColor = abc.color.input_back, });
Paragraph.SetProperties("menu_episode_description", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["EPISODE_DESC"]..":", BGColor = abc.color.epi, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("menu_button_back", { FontScript = global_settings_charset, Text = "[<] "..abc.language[global_settings_language]["BUTTON_BACK"], BorderColor = abc.color.epi, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
Page.SetObjectScript("menu_button_back", "On Enter", "local object_properties = Paragraph.GetProperties(\"menu_button_back\"); Image.SetProperties(\"object_frame_epi\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
Page.SetObjectScript("menu_button_back", "On Leave", "Image.SetVisible(\"object_frame_epi\", false);");
Paragraph.SetProperties("menu_button_new_location", { FontScript = global_settings_charset, Text = "[L] "..abc.language[global_settings_language]["BUTTON_NEW_LOCATION"], BorderColor = abc.color.epi, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
Page.SetObjectScript("menu_button_new_location", "On Enter", "local object_properties = Paragraph.GetProperties(\"menu_button_new_location\"); Image.SetProperties(\"object_frame_epi\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
Page.SetObjectScript("menu_button_new_location", "On Leave", "Image.SetVisible(\"object_frame_epi\", false);");
Paragraph.SetProperties("menu_button_new_stage", { FontScript = global_settings_charset, Text = "[S] "..abc.language[global_settings_language]["BUTTON_NEW_SCENE"], BorderColor = abc.color.epi, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
Page.SetObjectScript("menu_button_new_stage", "On Enter", "local object_properties = Paragraph.GetProperties(\"menu_button_new_stage\"); Image.SetProperties(\"object_frame_epi\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
Page.SetObjectScript("menu_button_new_stage", "On Leave", "Image.SetVisible(\"object_frame_epi\", false);");
Paragraph.SetProperties("menu_wordscounter_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_WORDS_COUNTER"]..":", BGColor = abc.color.epi, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("menu_wordscounter", { FontScript = global_settings_charset, Text = "", BGColor = abc.color.white, BorderColor = abc.color.epi, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("menu_button_previous", { FontScript = global_settings_charset, Text = "", BorderColor = abc.color.epi, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
Paragraph.SetProperties("menu_navigation_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_EPISODE_NAVIGATION"]..":", BGColor = abc.color.epi, ColorDisabled = abc.color.black, });
Page.SetObjectScript("menu_button_previous", "On Enter", "local object_properties = Paragraph.GetProperties(\"menu_button_previous\"); Image.SetProperties(\"object_frame_epi\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
Page.SetObjectScript("menu_button_previous", "On Leave", "Image.SetVisible(\"object_frame_epi\", false);");
Paragraph.SetProperties("menu_button_next", { FontScript = global_settings_charset, Text = "", BorderColor = abc.color.epi, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
Page.SetObjectScript("menu_button_next", "On Enter", "local object_properties = Paragraph.GetProperties(\"menu_button_next\"); Image.SetProperties(\"object_frame_epi\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
Page.SetObjectScript("menu_button_next", "On Leave", "Image.SetVisible(\"object_frame_epi\", false);");
	if global_episode_number ~= 1 then Paragraph.SetProperties("menu_button_previous", { Text = abc.language[global_settings_language]["GUI_EPISODE"].." "..(global_episode_number-1), Enabled = true, }); else Paragraph.SetProperties("menu_button_previous", { Text = abc.language[global_settings_language]["GUI_EPISODE"].." "..global_episode_number, Enabled = false, }); end
	if global_episode_number < XML.Count("root/project/episodes", "*") then Paragraph.SetProperties("menu_button_next", { Text = abc.language[global_settings_language]["GUI_EPISODE"].." "..(global_episode_number+1), Enabled = true, }); else Paragraph.SetProperties("menu_button_next", { Text = abc.language[global_settings_language]["GUI_EPISODE"].." "..global_episode_number, Enabled = false, }); end
end--function