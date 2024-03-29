abc.interface.scene_editor_update = function ()
local page_size = Page.GetSize();
local field_size = { Height = 0, }; characters_list = ""; characters_buttons = 1;
local field_position = Paragraph.GetPos("speech_field_1");--it first gets the position data of the first object if it exists
	if field_position == nil then field_position = { Y = 0, }; else field_position.Y = ( field_position.Y - 10 ); end
	if latest_input_editor ~= nil then abc.interface.text_editor_close(latest_input_editor); end
local objects_table = Page.EnumerateObjects();--only then it deletes all objects and draws them again starting from the old coordinates
	for object_number, object_name in pairs (objects_table) do
		if String.Find(object_name, "speech", 1, false) ~= -1 then
			if String.Find(object_name, "_field_", 1, false) == -1 then
			local speech_text = Paragraph.GetText(object_name);
			local speech_data = Crypto.BlowfishEncryptString(speech_text, global_safety_key, 0);
			XML.SetAttribute(global_scene_path.."/"..object_name, "speech_text", speech_data);
			end
		Page.DeleteObject(object_name);
		end
	end
Paragraph.SetEnabled("button_voiceover", false);
Paragraph.SetProperties("button_persona_1", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_1", false);
Paragraph.SetProperties("button_persona_2", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_2", false);
Paragraph.SetProperties("button_persona_3", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_3", false);
Paragraph.SetProperties("button_persona_4", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_4", false);
Paragraph.SetProperties("button_persona_5", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_5", false);
Paragraph.SetProperties("button_persona_6", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_6", false);
Paragraph.SetProperties("button_persona_7", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_7", false);
Paragraph.SetProperties("button_persona_8", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_8", false);
Paragraph.SetProperties("button_persona_9", { Text = "", Visible = false, });
Image.SetVisible("shadow_button_persona_9", false);

local_scene_index = XML.GetAttribute(global_scene_path, "scene_time");
local_scene_index = String.ToNumber(local_scene_index);
	if local_scene_index == 0 then local_scene_index = 1; XML.SetAttribute(global_scene_path, "scene_time", local_scene_index); end

Paragraph.SetText("button_scene_time", abc.scene_time[local_scene_index]);
local location_prefix = XML.GetAttribute(global_scene_path, "prefix_text");
	if location_prefix == "" then Paragraph.SetText("button_prefix", "INT."); XML.SetAttribute(global_scene_path, "prefix_text", "INT."); else Paragraph.SetText("button_prefix", location_prefix); end
local speeches_table = XML.GetElementNames(global_scene_path, false, false);
	if speeches_table == nil then speeches_table = {}; end local_speech_side = 0;

for speech_number, speech_tech_name in pairs (speeches_table) do
local character_tech_name = XML.GetAttribute(global_scene_path.."/"..speech_tech_name, "character_tech_name");
	if character_tech_name ~= "" then
	local character_role = XML.GetAttribute("root/project/characters/"..character_tech_name, "character_role");
	character_role = Crypto.BlowfishDecryptString(character_role, global_safety_key);
	local role_notice = XML.GetAttribute("root/project/characters/"..character_tech_name, "role_notice");
	role_notice = Crypto.BlowfishDecryptString(role_notice, global_safety_key);
		if role_notice ~= "" then character_notice = character_role.." ("..role_notice..")"; else character_notice = character_role; end
	character_notice = abc.tool.link_to_name(character_notice);
		if String.Find(characters_list, character_tech_name, 1, false) == -1 then
			if characters_buttons <= 9 then
			Paragraph.SetProperties("button_persona_"..characters_buttons, { Text = character_role, Visible = true, });
			Page.SetObjectScript("button_persona_"..characters_buttons, "On Click", "global_speech_name = abc.project.scene_fast_speech(\""..character_tech_name.."\"); Application.SetRedraw(false); abc.interface.scene_editor_update(); abc.interface.scene_workspace_scroll(); Application.SetRedraw(true);");
			Image.SetVisible("shadow_button_persona_"..characters_buttons, true);
			characters_buttons = characters_buttons + 1;
			characters_list = characters_list..character_tech_name;
			end
		end
	else character_notice = ""; end

local speech_data = XML.GetAttribute(global_scene_path.."/"..speech_tech_name, "speech_text");
local speech_text = Crypto.BlowfishDecryptString(speech_data, global_safety_key);
	if speech_number ~= 1 then
	field_position = Paragraph.GetPos("speech_field_"..( speech_number - 1 ));
	field_size = Paragraph.GetSize("speech_field_"..( speech_number - 1 ));
	end
	if global_setting_scene_gui == "SMALL" then object_x = ((page_size.Width/2)-(local_speech_size/2)); else object_x = 250; end
	local speech_type = XML.GetAttribute(global_scene_path.."/"..speech_tech_name, "speech_type");
	if speech_type == "" then if global_setting_scene_align == "ON" then local_input_aling = local_speech_side; else local_input_aling = 0; end
	Page.CreateObject(2, "speech_field_"..speech_number, { FontScript = global_settings_charset, Text = "["..speech_number.."] "..character_notice, X = object_x, Y = ( field_position.Y + field_size.Height + 10 ), Width = local_speech_size, Height = 90+10, BGStyle = 0, BGColor = abc.color.lime, ColorDisabled = abc.color.black, Alignment = local_speech_side, FontName = "Segoe UI", FontSize = abc.text_sizes_table[global_settings_textsize], FontWeight = 400, Enabled = false, });--39423
	Page.CreateObject(2, speech_tech_name, { FontScript = global_settings_charset, Text = speech_text, X = (object_x+1), Y = ( field_position.Y + 1 + field_size.Height + 10 + 30 ), Width = (local_speech_size-2), Height = 58+10, Alignment = local_input_aling, FontName = "Segoe UI", BGStyle = 0, BGColor = abc.color.input_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.black, ColorDown = abc.color.black, FontSize = abc.text_sizes_table[global_settings_textsize], FontWeight = 400, ScrollVertical = 2, });
		if local_speech_side == 0 then local_speech_side = 2; elseif local_speech_side == 2 then local_speech_side = 0; end
	elseif speech_type == "event" then
	Page.CreateObject(2, "speech_field_"..speech_number, { FontScript = global_settings_charset, Text = "["..speech_number.."] "..abc.language[global_settings_language]["EVENT"]..": ", X = object_x, Y = ( field_position.Y + field_size.Height + 10 ), Width = local_speech_size, Height = 90+10, BGStyle = 0, BGColor = abc.color.event, ColorDisabled = abc.color.black, FontName = "Segoe UI", FontSize = abc.text_sizes_table[global_settings_textsize], FontWeight = 400, Enabled = false, });
	Page.CreateObject(2, speech_tech_name, { FontScript = global_settings_charset, Text = speech_text, X = (object_x+1), Y = ( field_position.Y + 1 + field_size.Height + 10 + 30 ), Width = (local_speech_size-2), Height = 58+10, FontName = "Segoe UI", BGStyle = 0, BGColor = abc.color.input_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.black, ColorDown = abc.color.black, FontSize = abc.text_sizes_table[global_settings_textsize], FontWeight = 400, ScrollVertical = 2, });
	elseif speech_type == "voiceover" then if global_setting_scene_align == "ON" then local_input_aling = local_speech_side; else local_input_aling = 0; end
	Page.CreateObject(2, "speech_field_"..speech_number, { FontScript = global_settings_charset, Text = "["..speech_number.."] "..abc.language[global_settings_language]["VOICEOVER"]..": "..character_notice, X = object_x, Y = ( field_position.Y + field_size.Height + 10 ), Width = local_speech_size, Height = 90+10, BGStyle = 0, BGColor = abc.color.voiceover, ColorDisabled = abc.color.black, Alignment = local_speech_side, FontName = "Segoe UI", FontSize = abc.text_sizes_table[global_settings_textsize], FontWeight = 400, Enabled = false, });
	Page.CreateObject(2, speech_tech_name, { FontScript = global_settings_charset, Text = speech_text, X = (object_x+1), Y = ( field_position.Y + 1 + field_size.Height + 10 + 30 ), Width = (local_speech_size-2), Height = 58+10, Alignment = local_input_aling, FontName = "Segoe UI", BGStyle = 0, BGColor = abc.color.input_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.black, ColorDown = abc.color.black, FontSize = abc.text_sizes_table[global_settings_textsize], FontWeight = 400, ScrollVertical = 2, });
		if local_speech_side == 0 then local_speech_side = 2; elseif local_speech_side == 2 then local_speech_side = 0; end
	end
Page.SetObjectScript(speech_tech_name, "On Click", "abc.interface.scene_tools_close(); abc.interface.text_editor_open(\""..speech_tech_name.."\");");
Page.SetObjectScript(speech_tech_name, "On Enter", "abc.interface.scene_tools_open(\""..speech_tech_name.."\");");
end--for

Page.SetObjectZOrder("back_button_tool_apply", 0, "");
Page.SetObjectZOrder("button_tool_apply", 4, "back_button_tool_apply");
Page.SetObjectZOrder("shadow_button_tool_apply", 5, "back_button_tool_apply");
Page.SetObjectZOrder("back_button_tool_cancel", 0, "");
Page.SetObjectZOrder("button_tool_cancel", 4, "back_button_tool_cancel");
Page.SetObjectZOrder("shadow_button_tool_cancel", 5, "back_button_tool_cancel");
Page.SetObjectZOrder("shadow_button_tool_up", 0);
Page.SetObjectZOrder("back_button_tool_up", 0);
Page.SetObjectZOrder("button_tool_up", 0);
Page.SetObjectZOrder("shadow_button_tool_down", 0);
Page.SetObjectZOrder("back_button_tool_down", 0);
Page.SetObjectZOrder("button_tool_down", 0);
Page.SetObjectZOrder("shadow_button_tool_delete", 0);
Page.SetObjectZOrder("back_button_tool_delete", 0);
Page.SetObjectZOrder("button_tool_delete", 0);

local tech_lenght = XML.GetAttribute(global_scene_path, "tech_lenght");
	if tech_lenght == "" then tech_lenght = 0; end
Paragraph.SetText("gui_wordscounter_show", Math.Round((String.ToNumber(tech_lenght)/5.8), 0));
local scene_dialogs_count = XML.Count(global_scene_path, "*");
Paragraph.SetText("gui_dialogs_count_show", scene_dialogs_count);
scene_dialogs_count = Math.Round((tech_lenght/60), 0);--60 символов на каждый диалог
local scene_average_pages = Math.Round(( scene_dialogs_count / abc.dialogs_per_page[global_settings_dialogs_per_page] ), 0);
Paragraph.SetText("gui_pages_count_show", scene_average_pages);
Page.SetObjectZOrder("input_text_editor", ZORDER_FRONT, "");
end--function