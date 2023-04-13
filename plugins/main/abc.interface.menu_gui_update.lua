abc.interface.menu_gui_update = function ()
Image.SetProperties("object_frame_blue", { ImageFile = _SourceFolder..abc.theme.style_menu, Visible = false, });
Paragraph.SetProperties("gui_menu_line", { BGColor = abc.color.blue, });
Paragraph.SetProperties("gui_menu_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["MENU"], BorderColor = abc.color.blue, BGColor = abc.color.title_back, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_project_line", { BGColor = abc.color.rose, });
Paragraph.SetProperties("gui_project_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_PROJECT_TITLE"], BorderColor = abc.color.rose, BGColor = abc.color.title_back, ColorDisabled = abc.color.black, });
Paragraph.SetText("button_episodes_new", abc.language[global_settings_language]["BUTTON_EPISODE_NEW"].." ...");
Paragraph.SetText("button_scene_new", abc.language[global_settings_language]["BUTTON_NEW_SCENE"].." ...");
Paragraph.SetText("button_scenes_manager", abc.language[global_settings_language]["BUTTON_ALL_SCENES"].." ...");
Paragraph.SetText("button_locations_new", abc.language[global_settings_language]["BUTTON_NEW_LOCATION"].." ...");
Paragraph.SetText("button_locations_manager", abc.language[global_settings_language]["BUTTON_LOCATIONS_ALL"].." ...");
Paragraph.SetText("button_characters_new", abc.language[global_settings_language]["BUTTON_CHARACTER_NEW"].." ...");
Paragraph.SetText("button_characters_manager", abc.language[global_settings_language]["BUTTON_CHARACTER_ALL"].." ...");
Paragraph.SetText("button_menu_file_new", abc.language[global_settings_language]["BUTTON_PROJECT_NEW"].." ...");
Paragraph.SetText("button_menu_file_load", abc.language[global_settings_language]["BUTTON_PROJECT_LOAD"].." ...");
Paragraph.SetText("button_menu_file_save", abc.language[global_settings_language]["BUTTON_PROJECT_SAVE"]);
Paragraph.SetText("button_menu_file_close", abc.language[global_settings_language]["BUTTON_PROJECT_CLOSE"]);
Paragraph.SetText("button_project_export", abc.language[global_settings_language]["BUTTON_PROJECT_EXPORT"].." ...");
Paragraph.SetText("button_project_versions", abc.language[global_settings_language]["BUTTON_PROJECT_VERSIONS"].." ...");
Paragraph.SetText("button_menu_settings", abc.language[global_settings_language]["BUTTON_SETTINGS"].." ...");
Paragraph.SetText("button_menu_help", abc.language[global_settings_language]["BUTTON_HELP"].." ...");
Paragraph.SetText("button_menu_exit", abc.language[global_settings_language]["BUTTON_EXIT"]);
Paragraph.SetText("button_project_settings", abc.language[global_settings_language]["BUTTON_PROJECT_SETTINGS"].." ...");
Paragraph.SetText("button_project_hidden", abc.language[global_settings_language]["BUTTON_HIDDEN_ELEMENTS"].." ...");
Paragraph.SetText("button_project_dialogs", abc.language[global_settings_language]["BUTTON_ALL_DIALOGS"].." ...");
	if global_project_title ~= nil then
	Paragraph.SetEnabled("button_menu_file_new", false);
	Paragraph.SetEnabled("button_menu_file_load", false);
	Paragraph.SetEnabled("button_menu_file_save", true);
	Paragraph.SetEnabled("button_project_hidden", true);
	Paragraph.SetEnabled("button_project_dialogs", true);
	Paragraph.SetEnabled("button_project_settings", true);
	Paragraph.SetEnabled("button_project_export", true);
	Paragraph.SetEnabled("button_project_versions", true);
	Paragraph.SetEnabled("button_menu_file_close", true);
	else
	Paragraph.SetEnabled("button_menu_file_new", true);
	Paragraph.SetEnabled("button_menu_file_load", true);
	Paragraph.SetEnabled("button_menu_file_save", false);
	Paragraph.SetEnabled("button_project_hidden", false);
	Paragraph.SetEnabled("button_project_dialogs", false);
	Paragraph.SetEnabled("button_project_settings", false);
	Paragraph.SetEnabled("button_project_export", false);
	Paragraph.SetEnabled("button_project_versions", false);
	Paragraph.SetEnabled("button_menu_file_close", false);
	end
end--function