abc.project.scene_fast_speech = function (character_tech_name)
speech_tech_name = "speech"..abc.tool.fragment_name_generator();
XML.SetValue(global_scene_path.."/"..speech_tech_name, "", false);
XML.SetAttribute(global_scene_path.."/"..speech_tech_name, "character_tech_name", character_tech_name);
return speech_tech_name;
end--function