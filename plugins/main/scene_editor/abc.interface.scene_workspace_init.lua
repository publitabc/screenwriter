abc.interface.scene_workspace_init = function ()
local_speech_size = 760;
local_speech_number = 1;
local_speech_side = 2;
ListBox.DeleteItem("gui_list_members", -1);
ListBox.SetProperties("gui_list_members", { FontScript = global_settings_charset, FontSize = abc.text_sizes_table[global_settings_textsize], TextColor = abc.color.black, BackgroundColor = abc.color.list_back, });
Paragraph.SetText("button_preview", abc.language[global_settings_language]["BUTTON_PREVIEW"]);
	if abc.interface.scene_preview ~= nil then Paragraph.SetEnabled("button_preview", true); else Paragraph.SetEnabled("button_preview", false); end
Paragraph.SetText("button_save", abc.language[global_settings_language]["BUTTON_SAVE"]);
Paragraph.SetText("button_close", abc.language[global_settings_language]["BUTTON_CLOSE"]);
Paragraph.SetText("button_change_color", abc.language[global_settings_language]["BUTTON_CHANGE_COLOR"]);
Paragraph.SetText("button_new_event", abc.language[global_settings_language]["BUTTON_NEW_EVENT"]);
Paragraph.SetText("button_hide", abc.language[global_settings_language]["BUTTON_HIDE"]);
Paragraph.SetText("button_backup", abc.language[global_settings_language]["BUTTON_BACKUP"]);
Paragraph.SetText("button_split_scene", abc.language[global_settings_language]["BUTTON_SPLIT"].." ...");
Paragraph.SetText("button_voiceover", abc.language[global_settings_language]["VOICEOVER"]);
Paragraph.SetProperties("button_add_member", { Text = abc.language[global_settings_language]["BUTTON_ADD_MEMBER"], Enabled = false, });
Paragraph.SetProperties("gui_partic_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_DIALOG_PARTICS"]..":", BGColor = abc.color.lime, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_last_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_LAST_PARTICS"]..":", BGColor = abc.color.lime, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_last_field", { BorderColor = abc.color.lime, BGColor = abc.color.darklime, });
Paragraph.SetProperties("gui_info", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["INFO"]..":", BGColor = abc.color.lime, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_wordscounter_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_WORDS_COUNTER"]..":", BGColor = abc.color.white, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_wordscounter_show", { FontScript = global_settings_charset, BGColor = abc.color.white, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_dialogs_count", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_SCENE_DIALOGS"]..":", BGColor = abc.color.white, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_dialogs_count_show", { FontScript = global_settings_charset, BGColor = abc.color.white, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_pages_count", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_PAGES_COUNT"]..":", BGColor = abc.color.white, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_pages_count_show", { FontScript = global_settings_charset, BGColor = abc.color.white, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_scene_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["SCENE_TITLE"]..":", BGColor = abc.color.lime, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_story_sub", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["SCENE_STORY"]..":", BGColor = abc.color.lime, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_story_main", { FontScript = global_settings_charset, BGColor = abc.color.list_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
Paragraph.SetProperties("gui_menu_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["MENU"]..":", BGColor = abc.color.lime, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_menu_field", { BorderColor = abc.color.lime, BGColor = abc.color.darklime, });
Paragraph.SetProperties("gui_scene_tech_name", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_SCENE_TECH_NAME"], BGColor = abc.color.lime, ColorDisabled = abc.color.black, });
Paragraph.SetProperties("gui_scene_name_info", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["GUI_TECH_NAME_INFO"], BGColor = abc.color.lime, ColorDisabled = abc.color.black, });

Input.SetProperties("input_scene_title", { FontScript = global_settings_charset, FontColor = abc.color.black, BackgroundColor = abc.color.input_back, });
Input.SetProperties("input_scene_tech_name", { FontScript = global_settings_charset, FontColor = abc.color.black, BackgroundColor = abc.color.input_back, });
Image.SetProperties("object_frame_paper", { ImageFile = _SourceFolder..abc.theme.style_paper, });
Image.SetProperties("object_frame_lime", { ImageFile = _SourceFolder..abc.theme.style_scenes, });
Paragraph.SetProperties("gui_scene_help", { FontScript = global_settings_charset, TooltipText = abc.language[global_settings_language]["HELP_CHARACTER_LINK"], BGColor = abc.color.green, ColorNormal = abc.color.black, ColorHighlight = abc.color.black, ColorDown = abc.color.black, });
Image.SetProperties("button_tool_apply", { ImageFile = _SourceFolder..abc.theme.icon_apply, });
Image.SetProperties("button_tool_cancel", { ImageFile = _SourceFolder..abc.theme.icon_cancel, });
Image.SetProperties("button_tool_up", { ImageFile = _SourceFolder..abc.theme.icon_up, });
Image.SetProperties("button_tool_down", { ImageFile = _SourceFolder..abc.theme.icon_down, });
Image.SetProperties("button_tool_delete", { ImageFile = _SourceFolder..abc.theme.icon_delete, });
	if global_setting_scene_gui == "CLASSIC" then
	Paragraph.SetText("button_gui_style", abc.language[global_settings_language]["SCENE_GUI_CLASSIC"]);
	elseif global_setting_scene_gui == "SMALL" then
	Paragraph.SetText("button_gui_style", abc.language[global_settings_language]["SCENE_GUI_SMALL"]);
	end
	if global_setting_scene_align == "ON" then
	Paragraph.SetText("button_text_align", abc.language[global_settings_language]["SCENE_ALIGN_ON"]);
	elseif global_setting_scene_align == "OFF" then
	Paragraph.SetText("button_text_align", abc.language[global_settings_language]["SCENE_ALIGN_OFF"]);
	end
local objects_table = Page.EnumerateObjects();
	for object_number, object_name in pairs (objects_table) do
		if String.Find(object_name, "button", 1, false) ~= -1 then
			if Page.GetObjectType(object_name) == 2 then
			Paragraph.SetProperties(object_name, { FontScript = global_settings_charset, BorderColor = abc.color.lime, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
			Page.SetObjectScript(object_name, "On Enter", "local button_prop = Paragraph.GetProperties(\""..object_name.."\"); Image.SetProperties(\"object_frame_lime\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
			Page.SetObjectScript(object_name, "On Leave", "Image.SetVisible(\"object_frame_lime\", false);");
			end
		end
	end--for
local characters_table = XML.GetElementNames("root/project/characters", false, false);
	if characters_table == nil then characters_table = {}; end
	for character_number, character_tech_name in pairs (characters_table) do
	local show_status = XML.GetAttribute("root/project/characters/"..character_tech_name, "show_status");
		if show_status ~= "HIDDEN" then
		local character_role = XML.GetAttribute("root/project/characters/"..character_tech_name, "character_role");
		character_role = Crypto.BlowfishDecryptString(character_role, global_safety_key);
		local role_notice = XML.GetAttribute("root/project/characters/"..character_tech_name, "role_notice");
		role_notice = Crypto.BlowfishDecryptString(role_notice, global_safety_key);
			if role_notice ~= "" then character_notice = character_role.." ("..role_notice..")"; else character_notice = character_role; end
		character_notice = abc.tool.link_to_name(character_notice);
		ListBox.AddItem("gui_list_members", character_notice, character_tech_name);
		end--if show_status
	end--for
local completed_status = XML.GetAttribute(global_scene_path, "completed_status");
	if completed_status == "" then
	Paragraph.SetText("button_completed", abc.language[global_settings_language]["GUI_TEXT_NOT_COMPLETED"]);
	elseif completed_status == "COMPLETED" then
	Paragraph.SetText("button_completed", abc.language[global_settings_language]["GUI_TEXT_COMPLETED"]);
	elseif completed_status == "NOTCOMPLETED" then
	Paragraph.SetText("button_completed", abc.language[global_settings_language]["GUI_TEXT_NOT_COMPLETED"]);
	end
local scene_title = XML.GetAttribute(global_scene_path, "scene_title");
scene_title = Crypto.BlowfishDecryptString(scene_title, global_safety_key);
Input.SetText("input_scene_title", scene_title);
Input.SetText("input_scene_tech_name", global_scene_name);
global_story_name = XML.GetAttribute(global_scene_path, "main_story");
if global_story_name ~= "" then
local story_status = XML.GetAttribute("root/project/stories/"..global_story_name, "show_status");
local story_character_1 = XML.GetAttribute("root/project/stories/"..global_story_name, "character_1");
story_character_1 = XML.GetAttribute("root/project/characters/"..story_character_1, "character_role");
story_character_1 = Crypto.BlowfishDecryptString(story_character_1, global_safety_key);
local story_character_2 = XML.GetAttribute("root/project/stories/"..global_story_name, "character_2");
story_character_2 = XML.GetAttribute("root/project/characters/"..story_character_2, "character_role");
story_character_2 = Crypto.BlowfishDecryptString(story_character_2, global_safety_key);
local story_title = XML.GetAttribute("root/project/stories/"..global_story_name, "story_title");
story_title = Crypto.BlowfishDecryptString(story_title, global_safety_key);
local story_text = XML.GetAttribute("root/project/stories/"..global_story_name, "story_text");
story_text = Crypto.BlowfishDecryptString(story_text, global_safety_key);
story_text = abc.tool.link_to_name(story_text);
	if story_character_1 ~= story_character_2 then
	Paragraph.SetText("gui_story_main", story_character_1.." "..abc.language[global_settings_language]["AND"].." "..story_character_2..": "..story_title.."\r\n\n"..story_text);
	else Paragraph.SetText("gui_story_main", story_character_1..": "..story_title.."\r\n\n"..story_text); end
	if story_status == "HIDDEN" then local story_text = Paragraph.GetText("gui_story_main"); Paragraph.SetText("gui_story_main", "["..abc.language[global_settings_language]["HIDDEN_HINT"].."] "..story_text); end	
else
Paragraph.SetText("gui_story_main", "");
end
local show_status = XML.GetAttribute(global_scene_path, "show_status");
	if show_status == "HIDDEN" then Paragraph.SetEnabled("button_hide", false); else Paragraph.SetEnabled("button_hide", true); end
end--function