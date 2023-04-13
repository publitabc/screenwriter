abc.interface.gui_editor_update = function ()
Image.SetProperties("object_frame_rose", { ImageFile = _SourceFolder..abc.theme.style_project, Visible = false, });
local page_objects_table = Page.EnumerateObjects();
	for object_number, object_name in pairs (page_objects_table) do
		if String.Find(object_name, "gui", 1, false) == -1 then
			if String.Find(object_name, "character", 1, false) ~= -1 then Paragraph.SetProperties(object_name, { FontScript = global_settings_charset, BorderColor = abc.color.orange, BGColor = abc.color.button_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
			Page.SetObjectScript(object_name, "On Enter", "local object_properties = Paragraph.GetProperties(\""..object_name.."\"); Image.SetProperties(\"object_frame_orange\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
			Page.SetObjectScript(object_name, "On Leave", "Image.SetVisible(\"object_frame_orange\", false);");
			elseif String.Find(object_name, "location", 1, false) ~= -1 then Paragraph.SetProperties(object_name, { FontScript = global_settings_charset, BorderColor = abc.color.aqua, BGColor = abc.color.button_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
			Page.SetObjectScript(object_name, "On Enter", "local object_properties = Paragraph.GetProperties(\""..object_name.."\"); Image.SetProperties(\"object_frame_aqua\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
			Page.SetObjectScript(object_name, "On Leave", "Image.SetVisible(\"object_frame_aqua\", false);");
			elseif String.Find(object_name, "episode", 1, false) ~= -1 then Paragraph.SetProperties(object_name, { FontScript = global_settings_charset, BorderColor = abc.color.epi, BGColor = abc.color.button_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
			Page.SetObjectScript(object_name, "On Enter", "local object_properties = Paragraph.GetProperties(\""..object_name.."\"); Image.SetProperties(\"object_frame_epi\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
			Page.SetObjectScript(object_name, "On Leave", "Image.SetVisible(\"object_frame_epi\", false);");
			elseif String.Find(object_name, "menu", 1, false) ~= -1 then Paragraph.SetProperties(object_name, { FontScript = global_settings_charset, BorderColor = abc.color.blue, BGColor = abc.color.button_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
			Page.SetObjectScript(object_name, "On Enter", "local object_properties = Paragraph.GetProperties(\""..object_name.."\"); Image.SetProperties(\"object_frame_blue\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
			Page.SetObjectScript(object_name, "On Leave", "Image.SetVisible(\"object_frame_blue\", false);");
			elseif String.Find(object_name, "scene", 1, false) ~= -1 then Paragraph.SetProperties(object_name, { FontScript = global_settings_charset, BorderColor = abc.color.lime, BGColor = abc.color.button_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
			Page.SetObjectScript(object_name, "On Enter", "local object_properties = Paragraph.GetProperties(\""..object_name.."\"); Image.SetProperties(\"object_frame_lime\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
			Page.SetObjectScript(object_name, "On Leave", "Image.SetVisible(\"object_frame_lime\", false);");
			elseif String.Find(object_name, "project", 1, false) ~= -1 then Paragraph.SetProperties(object_name, { FontScript = global_settings_charset, BorderColor = abc.color.rose, BGColor = abc.color.button_back, ColorNormal = abc.color.black, ColorHighlight = abc.color.grey50, ColorDown = abc.color.grey25, });
			Page.SetObjectScript(object_name, "On Enter", "local object_properties = Paragraph.GetProperties(\""..object_name.."\"); Image.SetProperties(\"object_frame_rose\", { X = object_properties.X, Y = object_properties.Y, Width = object_properties.Width, Height = object_properties.Height, Visible = true, });");
			Page.SetObjectScript(object_name, "On Leave", "Image.SetVisible(\"object_frame_rose\", false);");
			end--if
		end--if
	end--for
end--function