abc.interface.story_choose_update = function ()
ListBox.DeleteItem("gui_stories_list", -1);
Paragraph.SetEnabled("button_choose", false);
Paragraph.SetEnabled("button_edit", false);
Image.SetVisible("object_frame_violet", false);
local stories_table = XML.GetElementNames("root/project/stories", false, false);
local stories_list = "";
	if stories_table == nil then stories_table = {}; end
	for story_number, story_name in pairs (stories_table) do
		if String.Find(stories_list, story_name, 1, false) == -1 then
		local story_show_status = XML.GetAttribute("root/project/stories/"..story_name, "show_status");
			if story_show_status ~= "HIDDEN" then
			stories_list = story_name..";"..stories_list;
			local story_character_1 = XML.GetAttribute("root/project/stories/"..story_name, "character_1");
			story_character_1 = XML.GetAttribute("root/project/characters/"..story_character_1, "character_role");
			story_character_1 = Crypto.BlowfishDecryptString(story_character_1, global_safety_key);
			local story_character_2 = XML.GetAttribute("root/project/stories/"..story_name, "character_2");
			story_character_2 = XML.GetAttribute("root/project/characters/"..story_character_2, "character_role");
			story_character_2 = Crypto.BlowfishDecryptString(story_character_2, global_safety_key);
			local story_title = XML.GetAttribute("root/project/stories/"..story_name, "story_title");
			story_title = Crypto.BlowfishDecryptString(story_title, global_safety_key);
				if story_character_1 ~= story_character_2 then
				ListBox.AddItem("gui_stories_list", story_character_1.." "..abc.language[global_settings_language]["AND"].." "..story_character_2..": "..story_title, story_name);
				else ListBox.AddItem("gui_stories_list", story_character_1..": "..story_title, story_name); end
			end--if hidden
		end--if find
	end--for
	if global_story_name ~= nil then
	local story_find = ListBox.FindItem("gui_stories_list", -1, LB_BYDATA, global_story_name);
		if story_find ~= -1 then ListBox.SelectItem("gui_stories_list", story_find); end
	end
end--function