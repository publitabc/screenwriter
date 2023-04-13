abc.interface.text_editor_close = function (object_name)
	if object_name ~= nil then
	local input_text = Input.GetText("input_text_editor");
	Paragraph.SetText(object_name, input_text);
	end
Input.SetProperties("input_text_editor", { Text = "", Visible = false, });
latest_input_editor = nil;
Image.SetVisible("button_tool_apply", false);
Paragraph.SetVisible("back_button_tool_apply", false);
Image.SetVisible("shadow_button_tool_apply", false);
Image.SetVisible("button_tool_cancel", false);
Paragraph.SetVisible("back_button_tool_cancel", false);
Image.SetVisible("shadow_button_tool_cancel", false);
Image.SetVisible("button_tool_delete", false);
Paragraph.SetVisible("back_button_tool_delete", false);
Image.SetVisible("shadow_button_tool_delete", false);
Paragraph.SetProperties("button_voiceover", { Text = abc.language[global_settings_language]["VOICEOVER"], Enabled = false, });
end--function