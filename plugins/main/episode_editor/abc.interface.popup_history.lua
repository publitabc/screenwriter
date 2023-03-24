abc.interface.popup_history_show = function (location_number)
local result = System.GetMousePosition(true, nil);
	if result.X >= (global_window_width-160) then result.X = (result.X-160); end
	if result.Y >= (global_window_height-180) then result.Y = (result.Y-180); end
Page.CreateObject(2, "popup_item_2", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_ADD_SCENE"].." >", Visible = true, X = result.X, Y = result.Y, Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_item_2", "On Click", "abc.interface.popup_sub_hide(); abc.interface.popup_history_item_2("..location_number..");");
Page.SetObjectScript("popup_item_2", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_item_2\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_item_2", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
Page.CreateObject(2, "popup_item_3", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_UP"], Visible = true, X = result.X, Y = (result.Y+30-1), Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_item_3", "On Click", "abc.interface.popup_history_item_3("..location_number.."); Page.Jump(\"history_update\");");
Page.SetObjectScript("popup_item_3", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_item_3\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_item_3", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
	if location_number == 1 then Paragraph.SetEnabled("popup_item_3", false); else Paragraph.SetEnabled("popup_item_3", true); end
Page.CreateObject(2, "popup_item_4", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_DOWN"], Visible = true, X = result.X, Y = (result.Y+60-2), Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_item_4", "On Click", "abc.interface.popup_history_item_4("..location_number.."); Page.Jump(\"history_update\");");
Page.SetObjectScript("popup_item_4", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_item_4\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_item_4", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
local locations_count = XML.Count("root/project/episodes/episode:"..global_episode_number, "*");
	if location_number == locations_count then Paragraph.SetEnabled("popup_item_4", false); else Paragraph.SetEnabled("popup_item_4", true); end
Page.CreateObject(2, "popup_item_5", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_CHANGE_LOCATION"].." >", Visible = true, X = result.X, Y = (result.Y+90-3), Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_item_5", "On Click", "abc.interface.popup_sub_hide(); abc.interface.popup_history_item_5("..location_number..");");
Page.SetObjectScript("popup_item_5", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_item_5\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_item_5", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
Page.CreateObject(2, "popup_item_6", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_DELETE_LOCATION"], Visible = true, X = result.X, Y = (result.Y+120-4), Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_item_6", "On Click", "abc.interface.popup_history_item_6("..location_number.."); Page.Jump(\"history_update\");");
Page.SetObjectScript("popup_item_6", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_item_6\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_item_6", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
Page.CreateObject(2, "popup_edit_location", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_EDIT"], Visible = true, X = result.X, Y = (result.Y+150-5), Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_edit_location", "On Click", "abc.interface.popup_sub_hide(); global_location_name = XML.GetAttribute(\"root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."\", \"tech_name\"); if DialogEx.Show(\"dialog_location_editor\", true, nil, nil) ~= 2 then Page.Jump(\"history_update\"); end");
Page.SetObjectScript("popup_edit_location", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_edit_location\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_edit_location", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
Page.SetObjectZOrder("object_frame_blue", 0, "");
end--function

abc.interface.popup_history_item_2 = function (location_number)
global_popup_click = "add scene";
local result = Paragraph.GetPos("popup_item_2");
	if result.X >= (global_window_width-(160*2)) then result.X = (result.X-(160*2)); end
Page.CreateObject(2, "popup_sub_all_scenes", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_ALL_SCENES"].." ...", Visible = true, X = result.X+160, Y = result.Y, Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_sub_all_scenes", "On Click", "if abc.interface.popup_scene_choose("..location_number..") ~= 2 then Page.Jump(\"history_update\"); end");
Page.SetObjectScript("popup_sub_all_scenes", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_sub_all_scenes\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_sub_all_scenes", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
result.Y = (result.Y+29);
local scenes_table = XML.GetElementNames("root/project/scenes", false, false);
	if scenes_table == nil then scenes_table = {}; end
	for scene_number, scene_name in pairs (scenes_table) do
		if XML.GetAttribute("root/project/scenes/"..scene_name, "show_status") ~= "HIDDEN" then
		local scene_title = XML.GetAttribute("root/project/scenes/"..scene_name, "scene_title");
		scene_title = Crypto.BlowfishDecryptString(scene_title, global_safety_key);
		scene_title = abc.tool.link_to_name(scene_title);
			if scene_title == "" then scene_title = abc.tool.string_upper(scene_name); else scene_title = abc.tool.string_upper(scene_title); end
		Page.CreateObject(2, "popup_sub_"..scene_number, { FontScript = global_settings_charset, FontSize = 9, Text = scene_title, Visible = true, X = (result.X+160-1), Y = result.Y, Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
		Page.SetObjectScript("popup_sub_"..scene_number, "On Click", "abc.interface.popup_add_scene("..location_number..", \""..scene_name.."\"); Page.Jump(\"history_update\");");
		Page.SetObjectScript("popup_sub_"..scene_number, "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_sub_"..scene_number.."\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
		Page.SetObjectScript("popup_sub_"..scene_number, "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
		result.Y = (result.Y+29);
		end--if
	end--for
Page.CreateObject(2, "popup_sub_new_scene", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_NEW_SCENE"].." ...", Visible = true, X = result.X+160, Y = result.Y, Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_sub_new_scene", "On Click", "abc.interface.popup_history_item_2A("..location_number..");Page.Jump(\"history_update\");");
Page.SetObjectScript("popup_sub_new_scene", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_sub_new_scene\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_sub_new_scene", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
Page.SetObjectZOrder("object_frame_blue", 0, "");
end--function

abc.interface.popup_history_item_2A = function (location_number)
local scene_tech_name = "scene"..abc.tool.fragment_name_generator();
XML.SetValue("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "", false);
local scene_tech_color = abc.tool.color_generator();
local tech_color_data = Crypto.BlowfishEncryptString(scene_tech_color, global_safety_key, 0);
XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "tech_color", tech_color_data);
XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "tech_lenght", 0);
XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "scene_time", 1);
local scene_title_data = Crypto.BlowfishEncryptString(scene_tech_name, global_safety_key, 0);
XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "scene_title", scene_title_data);
XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name, "tech_pos", System.GetMousePosition(true, nil).X*global_width_coef);
end--function

abc.interface.popup_location_choose = function (location_number)
local location_result = DialogEx.Show("dialog_location_choose", true, nil, nil);
	if location_result ~= 2 then
		if global_location_name ~= nil then
		XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number, "tech_name", global_location_name);
		global_location_name = nil;
		end
	end
return location_result
end--function

abc.interface.popup_scene_choose = function (location_number)
local tech_pos = System.GetMousePosition(true, nil).X;
local dialog_return = DialogEx.Show("dialog_scene_choose", true, nil, nil);
	if dialog_return ~= 2 then
	local scene_data = XML.GetElementXML("root/project/scenes/"..global_scene_name);
	XML.RemoveElement("root/project/scenes/"..global_scene_name);
	XML.SetValue("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/index", "", false);
	XML.InsertXML("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/index", scene_data, 2);
	XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..global_scene_name, "tech_pos", tech_pos);
	global_scene_name = nil;
	end--if
return dialog_return
end--function

abc.interface.popup_add_scene = function (location_number, scene_name)
local scene_data = XML.GetElementXML("root/project/scenes/"..scene_name);
local tech_pos = XML.GetAttribute("root/project/scenes/"..scene_name, "tech_pos");
	if tech_pos ~= "" then tech_pos = String.ToNumber(tech_pos); else tech_pos = System.GetMousePosition(true, nil).X; end
XML.RemoveElement("root/project/scenes/"..scene_name);
XML.SetValue("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/index", "", false);
XML.InsertXML("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/index", scene_data, 1);
XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_name, "tech_pos", tech_pos);
XML.RemoveElement("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/index");
end--function

abc.interface.popup_history_item_3 = function (location_number)
local location_data = XML.GetElementXML("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number);
XML.RemoveElement("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number);
XML.InsertXML("root/project/episodes/episode:"..global_episode_number.."/location:"..(location_number-1), location_data, 0);
end--function

abc.interface.popup_history_item_4 = function (location_number)
local location_data = XML.GetElementXML("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number);
XML.InsertXML("root/project/episodes/episode:"..global_episode_number.."/location:"..(location_number+1), location_data, 1);
XML.RemoveElement("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number);
end--function

abc.interface.popup_history_item_5 = function (location_number)
Application.SetRedraw(false);
global_popup_click = "change location";
local result = Paragraph.GetPos("popup_item_5");
Page.CreateObject(2, "popup_sub_location_choose", { FontScript = global_settings_charset, FontSize = 9, Text = abc.language[global_settings_language]["BUTTON_LOCATIONS_ALL"].." ...", Visible = true, X = (result.X+160-1), Y = result.Y, Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
Page.SetObjectScript("popup_sub_location_choose", "On Click", "if abc.interface.popup_location_choose("..location_number..") ~= 2 then Page.Jump(\"history_update\"); end");
Page.SetObjectScript("popup_sub_location_choose", "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_sub_location_choose\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
Page.SetObjectScript("popup_sub_location_choose", "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
result.Y = (result.Y+29);
local element_names = XML.GetElementNames("root/project/locations", false, false);
	if element_names == nil then element_names = {}; end
	for element_number, element_name in pairs (element_names) do
		if XML.GetAttribute("root/project/locations/"..element_name, "show_status") ~= "HIDDEN" then
		local location_title = XML.GetAttribute("root/project/locations/"..element_name, "location_title");
		location_title = Crypto.BlowfishDecryptString(location_title, global_safety_key);
			if location_title == "" then location_title = abc.tool.string_upper(element_name); else location_title = abc.tool.string_upper(location_title); end
			if String.Length(location_title) >= 18 then location_title = String.Mid(location_title, 1, 18).." ..."; end
		Page.CreateObject(2, "popup_sub_"..element_number, { FontScript = global_settings_charset, FontSize = 9, Text = location_title, Visible = true, X = (result.X+160-1), Y = result.Y, Width = 160, Height = 30, BorderStyle = 1, BorderColor = abc.color.blue, BGStyle = 0, BGColor = abc.color.white, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, ScrollHorizontal = 2, ScrollVertical = 2, Cursor = 1, });
		Page.SetObjectScript("popup_sub_"..element_number, "On Click", "abc.interface.popup_history_item_5A("..location_number..", \""..element_name.."\"); Page.Jump(\"history_update\");");
		Page.SetObjectScript("popup_sub_"..element_number, "On Enter", "local button_prop = Paragraph.GetProperties(\"popup_sub_"..element_number.."\"); Image.SetProperties(\"object_frame_blue\", { X = button_prop.X, Y = button_prop.Y, Width = button_prop.Width, Height = button_prop.Height, Visible = true, });");
		Page.SetObjectScript("popup_sub_"..element_number, "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
		result.Y = (result.Y+29);
		end--if
	end--for
Application.SetRedraw(true);
Page.SetObjectZOrder("object_frame_blue", 0, "");
end--function

abc.interface.popup_history_item_5A = function (location_number, location_name)
XML.SetAttribute("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number, "tech_name", location_name);
end--function

abc.interface.popup_history_item_6 = function (location_number)
local scenes_table = XML.GetElementNames("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number, false, false);
	if scenes_table == nil then scenes_table = {}; end
	for scene_number, scene_tech_name in pairs (scenes_table) do
	local scene_tech_data = XML.GetElementXML("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name);
	XML.RemoveElement("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number.."/"..scene_tech_name);
	XML.SetValue("root/project/scenes/index", "", false);
	XML.InsertXML("root/project/scenes/index", scene_tech_data, 2);
	end--for
XML.RemoveElement("root/project/episodes/episode:"..global_episode_number.."/location:"..location_number);
end--function

abc.interface.popup_hide = function ()
	if global_popup_click == nil then
	Image.SetVisible("object_frame_blue", false);
	local object_table = Page.EnumerateObjects();
		for object_number, object_name in pairs (object_table) do
			if String.Find(object_name, "popup", 1, false) ~= -1 then Page.DeleteObject(object_name); end
		end--for
	else global_popup_click = nil;
	end
end--function

abc.interface.popup_sub_hide = function ()
	if global_popup_click == nil then
	local object_table = Page.EnumerateObjects();
		for object_number, object_name in pairs (object_table) do
			if String.Find(object_name, "popup_sub", 1, false) ~= -1 then Page.DeleteObject(object_name); end
		end--for
	else global_popup_click = nil;
	end
end--function