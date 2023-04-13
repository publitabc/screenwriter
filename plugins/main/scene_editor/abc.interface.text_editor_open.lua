abc.interface.text_editor_open = function (object_name)
	if XML.GetAttribute(global_scene_path, "completed_status") == "COMPLETED" then return end
	if latest_input_editor == nil then latest_input_editor = object_name; else
	abc.interface.text_editor_close(latest_input_editor);
	latest_input_editor = object_name; end
local object_prop = Paragraph.GetProperties(object_name);
Input.SetProperties("input_text_editor", { FontScript = global_settings_charset, Text = object_prop.Text, X = object_prop.X, Y = object_prop.Y, Width = object_prop.Width, Height = object_prop.Height, Border = 0, HScrollbar = false, VScrollbar = false, Multiline = true, Alignment = object_prop.Alignment, FontName = object_prop.FontName, BackgroundColor = abc.color.input_back, FontSize = abc.text_sizes_table[global_settings_textsize], FontWeight = 400, Visible = true, });
Page.SetObjectScript("input_text_editor", "On Key", "if e_Key == 13 then abc.interface.text_editor_close(\""..object_name.."\"); elseif e_Key == 27 then abc.interface.text_editor_close(); end");
Page.SetObjectScript("button_tool_apply", "On Click", "abc.interface.text_editor_close(\""..object_name.."\");");
	if object_prop.Alignment == 2 then object_prop.Offset = 10; else object_prop.Offset = (object_prop.Width-80); end
Image.SetProperties("shadow_button_tool_apply", { X = (object_prop.X+object_prop.Offset-3), Y = (object_prop.Y-30-10), Visible = true, });
Paragraph.SetProperties("back_button_tool_apply", { X = (object_prop.X+object_prop.Offset), Y = (object_prop.Y-30-10), BGColor = abc.color.darklime, Visible = true, });
Image.SetProperties("button_tool_apply", { X = (object_prop.X+object_prop.Offset), Y = (object_prop.Y-30-10), Visible = true, Opacity = 100, });
Image.SetProperties("shadow_button_tool_cancel", { X = (object_prop.X+object_prop.Offset+30+10-3), Y = (object_prop.Y-30-10), Visible = true, });
Paragraph.SetProperties("back_button_tool_cancel", { X = (object_prop.X+object_prop.Offset+30+10), Y = (object_prop.Y-30-10), BGColor = abc.color.darklime, Visible = true, });
Image.SetProperties("button_tool_cancel", { X = (object_prop.X+object_prop.Offset+30+10), Y = (object_prop.Y-30-10), Visible = true, Opacity = 100, });
local speech_type = XML.GetAttribute(global_scene_path.."/"..object_name, "speech_type");
	if speech_type == "" then Paragraph.SetProperties("button_voiceover", { Text = abc.language[global_settings_language]["BUTTON_SET_VO"], Enabled = true, });
	elseif speech_type == "voiceover" then Paragraph.SetProperties("button_voiceover", { Text = abc.language[global_settings_language]["BUTTON_REMOVE_VO"], Enabled = true, });
	elseif speech_type == "event" then Paragraph.SetProperties("button_voiceover", { Text = abc.language[global_settings_language]["VOICEOVER"], Enabled = false, }); end
local_speech_name = object_name;
end--function