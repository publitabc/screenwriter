abc.interface.characters_gui_update = function ()
Image.SetProperties("object_frame_orange", { ImageFile = _SourceFolder..abc.theme.style_characters, Visible = false, });
	for object_number = 1, 16 do Paragraph.SetProperties("object_character_"..object_number, { Text = "", Visible = false, BorderColor = abc.color.orange, }); end
local gui_line = 110;
local character_index = 0;
Paragraph.SetProperties("gui_characters_line", { Height = (gui_line+100), BGColor = abc.color.orange, });
Paragraph.SetProperties("gui_characters_title", { FontScript = global_settings_charset, Text = abc.language[global_settings_language]["CHARACTERS"], BorderColor = abc.color.orange, BGColor = abc.color.title_back, ColorDisabled = abc.color.black, });
	if global_project_title ~= nil then
	Paragraph.SetEnabled("button_characters_new", true);
	Paragraph.SetEnabled("button_characters_manager", true);
	else
	Paragraph.SetEnabled("button_characters_new", false);
	Paragraph.SetEnabled("button_characters_manager", false);
	end
local characters_table = XML.GetElementNames("root/project/characters", false, false);
	if characters_table == nil then characters_table = {}; end
	for character_number, character_tech_name in pairs (characters_table) do
		if XML.GetAttribute("root/project/characters/"..character_tech_name, "show_status") ~= "HIDDEN" then
		character_index = character_index + 1;
		gui_line = gui_line + 50;
		local character_role = XML.GetAttribute("root/project/characters/"..character_tech_name, "character_role");
		character_role = Crypto.BlowfishDecryptString(character_role, global_safety_key);
		local role_notice = XML.GetAttribute("root/project/characters/"..character_tech_name, "role_notice");
		role_notice = Crypto.BlowfishDecryptString(role_notice, global_safety_key);
			if role_notice ~= "" then character_notice = character_role.."\r\n ("..role_notice..")"; else character_notice = character_role; end
		character_notice = abc.tool.link_to_name(character_notice);
			if global_settings_scale_gui == "TRUE" then length_string = String.Length(character_notice);
				if length_string > 36 then length_string = (length_string*4.2); if length_string > 180 then length_string = 180; end else length_string = 140; end
			else length_string = 140; end
		Paragraph.SetProperties("object_character_"..character_index, { Width = length_string, Text = character_notice, Visible = true, });
		Paragraph.SetProperties("gui_characters_line", { Height = (gui_line+100), });
		Page.SetObjectScript("object_character_"..character_index, "On Click", "abc.interface.characters_gui_click(\""..character_tech_name.."\");");
		Page.SetObjectScript("object_character_"..character_index, "On Right-Click", "global_character_name = \""..character_tech_name.."\"; Page.Jump(\"storyline\");");
		end--if
		if character_index == 16 then break end
	end--for
global_character_link = nil;
end--function