abc.interface.gui_history_delete = function ()
Paragraph.SetVisible("menu_timeline_line", false);
Paragraph.SetVisible("menu_timeline_display", false);
Image.SetVisible("object_frame_epi", false);
Image.SetVisible("object_frame_blue", false);
local objects_table = Page.EnumerateObjects();
	for object_number, object_name in pairs (objects_table) do
		if String.Find(object_name, "scene", 1, false) ~= -1 then Page.DeleteObject(object_name); end
		if String.Find(object_name, "field_location", 1, false) ~= -1 then Page.DeleteObject(object_name); end
	end--for
end--function