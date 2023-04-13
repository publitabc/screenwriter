abc.interface.scene_tools_open = function (object_name)
	if XML.GetAttribute(global_scene_path, "completed_status") == "COMPLETED" then return end
local object_prop = Paragraph.GetProperties(object_name);
	if object_prop.Alignment == 2 then object_prop.Offset = 10; else object_prop.Offset = (object_prop.Width-120); end
Paragraph.SetProperties("back_button_tool_up", { X = (object_prop.X+object_prop.Offset), Y = (object_prop.Y-30-10), BGColor = abc.color.darklime, Visible = true, Enabled = false, });
Image.SetProperties("shadow_button_tool_up", { X = (object_prop.X+object_prop.Offset-3), Y = (object_prop.Y-30-10), Visible = true, Enabled = false, });
Image.SetProperties("button_tool_up", { X = (object_prop.X+object_prop.Offset), Y = (object_prop.Y-30-10), Opacity = 100, Visible = true, });
Page.SetObjectScript("button_tool_up", "On Click", "abc.interface.text_editor_close(); abc.interface.scene_tools_close(); if abc.interface.scene_tools_move(\""..object_name.."\", \"UP\") == true then Application.SetRedraw(false); abc.interface.scene_editor_update(); Application.SetRedraw(true); end");
Paragraph.SetProperties("back_button_tool_down", { X = (object_prop.X+object_prop.Offset+30+10), Y = (object_prop.Y-30-10), BGColor = abc.color.darklime, Visible = true, Enabled = false, });
Image.SetProperties("shadow_button_tool_down", { X = (object_prop.X+object_prop.Offset+30+10-3), Y = (object_prop.Y-30-10), Visible = true, Enabled = false, });
Image.SetProperties("button_tool_down", { X = (object_prop.X+object_prop.Offset+30+10), Y = (object_prop.Y-30-10), Opacity = 100, Visible = true, });
Page.SetObjectScript("button_tool_down", "On Click", "abc.interface.text_editor_close(); abc.interface.scene_tools_close(); if abc.interface.scene_tools_move(\""..object_name.."\", \"DOWN\") == true then Application.SetRedraw(false); abc.interface.scene_editor_update(); Application.SetRedraw(true); end");
Paragraph.SetProperties("back_button_tool_delete", { X = (object_prop.X+object_prop.Offset+30+10+30+10), Y = (object_prop.Y-30-10), BGColor = abc.color.darklime, Visible = true, Enabled = false, });
Image.SetProperties("shadow_button_tool_delete", { X = (object_prop.X+object_prop.Offset+30+10-3+30+10), Y = (object_prop.Y-30-10), Visible = true, Enabled = false, });
Image.SetProperties("button_tool_delete", { X = (object_prop.X+object_prop.Offset+30+10+30+10), Y = (object_prop.Y-30-10), Opacity = 100, Visible = true, });
Page.SetObjectScript("button_tool_delete", "On Click", "abc.interface.text_editor_close(); abc.interface.scene_tools_close(); if abc.interface.scene_tools_delete(\""..object_name.."\") == true then Application.SetRedraw(false); abc.interface.scene_editor_update(); Application.SetRedraw(true); end");
end--function