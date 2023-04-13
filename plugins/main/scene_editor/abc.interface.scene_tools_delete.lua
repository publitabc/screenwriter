abc.interface.scene_tools_delete = function (object_name)
local success; if object_name == nil then return end
XML.RemoveElement(global_scene_path.."/"..object_name);
	if Application.GetLastError() == 0 then success = true; end
return success
end--function