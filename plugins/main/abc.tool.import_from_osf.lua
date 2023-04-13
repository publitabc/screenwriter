abc.tool.import_from_osf = function (file_path, debugmode)
	if file_path == nil then return end
	if debugmode == nil then debugmode = false; end
local project_data = XML.GetXML();
local file_split = String.SplitPath(file_path);
	if File.DoesExist(_TempFolder.."\\document.xml") == true then File.Delete(_TempFolder.."\\document.xml", false, false, false, nil); end
if file_split.Extension == ".fadein" then
Zip.Extract(file_path, {"*.*"}, _TempFolder, true, true, "", 2, nil);
XML.Load(_TempFolder.."\\document.xml");
local last_error = Application.GetLastError();
	if last_error ~= 0 then
	global_error_code = "350";
	global_error_text = file_path.."\r\n"..abc.tool.string_upper(_tblErrorMessages[last_error]);
	DialogEx.Show("dialog_error", true, nil, nil);
	XML.SetXML(project_data);
	return
	end
File.Delete(_TempFolder.."\\document.xml", false, false, false, nil);
elseif file_split.Extension == ".xml" then
XML.Load(file_path);
local last_error = Application.GetLastError();
	if last_error ~= 0 then
	global_error_code = "350";
	global_error_text = file_path.."\r\n"..abc.tool.string_upper(_tblErrorMessages[last_error]);
	DialogEx.Show("dialog_error", true, nil, nil);
	XML.SetXML(project_data);
	return
	end
else return
end

local file_type = XML.GetAttribute("document", "type");
	if file_type ~= "Open Screenplay Format document" then
	global_error_code = "351";
	global_error_text = abc.tool.string_upper(file_path);
	DialogEx.Show("dialog_error", true, nil, nil);
	XML.SetXML(project_data);
	return
	end

StatusDlg.Show(MB_ICONNONE, false);
StatusDlg.SetTitle(abc.language[global_settings_language]["GUI_SCENARIO_IMPORT"]);
StatusDlg.SetMessage(String.Upper(file_split.Filename));
	if debugmode == true then Debug.ShowWindow(true); end

local local_scenes_count = 0;
local import_data = XML.GetXML();
local search_position = 1;
while String.Find(import_data, "basestyle=\"Scene Heading\"", search_position, false) ~= -1 do search_position = 1 + String.Find(import_data, "basestyle=\"Scene Heading\"", search_position, false); local_scenes_count = local_scenes_count + 1; end

local scene_tech_pos_coef = (global_window_width/local_scenes_count);
	if scene_tech_pos_coef < 10 then scene_tech_pos_coef = 10; end

--episode--episode--episode--episode--episode--episode--episode--episode--episode--episode
local episodes_count = XML.Count("document/project/episodes", "episode");
	if episodes_count == -1 then episodes_count = 1; else episodes_count = episodes_count + 1; end
local fragment_name = abc.tool.fragment_name_generator();
local episode_title = Crypto.BlowfishEncryptString("IMPORT EPISODE #"..episodes_count, global_safety_key, 0);
local episode_name = Crypto.BlowfishEncryptString("episode"..fragment_name, global_safety_key, 0);
episode_path = "document/project/episodes/episode:"..episodes_count;
XML.SetValue(episode_path, "", false);
XML.SetAttribute(episode_path, "tech_name", episode_name);
XML.SetAttribute(episode_path, "episode_title", episode_title);
XML.SetAttribute(episode_path, "episode_description", "");
--episode--episode--episode--episode--episode--episode--episode--episode--episode--episode

local location_prefix = "";
local local_scenes_number = 0;
local paragraphs_table = XML.GetElementNames("document/paragraphs", true, true);
	if paragraphs_table == nil then paragraphs_table = {}; end

local paragraphs_count = Table.Count(paragraphs_table);
StatusDlg.SetMeterRange(0, paragraphs_count);

for paragraph_number, paragraph_path in pairs (paragraphs_table) do
StatusDlg.SetMeterPos(paragraph_number);
local paragraph_style = XML.GetAttribute(paragraph_path.."/style", "basestyle");
local paragraph_text = XML.GetValue(paragraph_path.."/text");
StatusDlg.SetStatusText(paragraph_text);

if paragraph_style == "Scene Heading" then--заголовок сцены
episode_location_finded_path = nil;--удаляется адрес локации внутри эпизода перед обработкой новой сцены
project_location_tech_name = nil;
scene_finded_path = nil;--удаляется путь к прошлой сцене перед созданием новой
location_prefix = "";
local scene_title_end = -1;

--получение заголовка локации
local location_title_new = XML.GetValue(paragraph_path.."/text");
	if String.Find(location_title_new, "INT.", 1, false) ~= -1 then location_prefix = "INT."; location_title_new = String.Replace(location_title_new, "INT.", "", false);
	elseif String.Find(location_title_new, "EXT.", 1, false) ~= -1 then location_prefix = "EXT."; location_title_new = String.Replace(location_title_new, "EXT.", "", false);
	elseif String.Find(location_title_new, "INT./EXT.", 1, false) ~= -1 then location_prefix = "INT./EXT."; location_title_new = String.Replace(location_title_new, "INT./EXT.", "", false);
	end

	for time_number, time_text in pairs (abc.scene_time) do--поиск названия времени в заголовке сцены
	--local find_title_end = String.Find(location_title_new, time_text, 1, false);
	local find_title_end = String.ReverseFind(location_title_new, time_text, false);
		if find_title_end ~= -1 then scene_time_index = time_number; scene_title_end = find_title_end; end
	end

	--if scene_title_end == nil then scene_title_end = String.ReverseFind(location_title_new, "-", false); end
	if scene_title_end == -1 then scene_title_end = 3 + String.Length(location_title_new); end
location_title_new = String.Mid(location_title_new, 1, (scene_title_end-3));
location_title_new = String.TrimLeft(location_title_new, nil);
location_title_new = String.TrimRight(location_title_new, nil);
scene_title_end = nil;

--получение названия локации по заголовку
local locations_table = XML.GetElementNames("document/project/locations", true, false);
	if locations_table == nil then locations_table = {}; end
for location_number, location_path in pairs (locations_table) do--перебор локаций из проекта
local location_title_ext = XML.GetAttribute(location_path, "location_title");
location_title_ext = Crypto.BlowfishDecryptString(location_title_ext, global_safety_key);
local slash_find = String.ReverseFind(location_path, "/", false);
project_location_tech_name = String.Mid(location_path, (slash_find+1), -1);
if location_title_new == location_title_ext then--если локация с таким заголовком уже есть в проекте
	if debugmode == true then Debug.Print("300-НАЙДЕНА В ПРОЕКТЕ: ЛОКАЦИЯ С НАЗВАНИЕМ "..location_title_new.." УЖЕ ЕСТЬ В ПРОЕКТЕ\r\n"); end
local episode_locations_table = XML.GetElementNames(episode_path, true, true);
	if episode_locations_table == nil then episode_locations_table = {}; end
	for episode_location_number, episode_location_path in pairs (episode_locations_table) do--поиск локации внутри эпизода
	local episode_location_tech_name = XML.GetAttribute(episode_location_path, "tech_name");
		if project_location_tech_name == episode_location_tech_name then--если локация уже есть в эпизоде
			if debugmode == true then Debug.Print("306-НАЙДЕНО В ЭПИЗОДЕ: ЛОКАЦИЯ С НАЗВАНИЕМ "..location_title_new.." ЕСТЬ ЭПИЗОДЕ\r\n"); end
		episode_location_finded_path = episode_location_path;--адрес локации найденой внутри эпизода
		break
		end--if
	end--for--перебор локаций из проекта
	if episode_location_finded_path == nil then--в эпизод добавляется локация с таким техническим названием
		if debugmode == true then Debug.Print("311-ДОБАВЛЯЕМ В ЭПИЗОД: ЛОКАЦИИ С НАЗВАНИЕМ "..location_title_new.." НЕТ В ЭПИЗОДЕ\r\n"); end
	local locations_count = XML.Count(episode_path, "location");
		if locations_count == -1 then locations_count = 0; end
	episode_location_finded_path = episode_path.."/location:"..(locations_count+1);
	XML.SetValue(episode_location_finded_path, "", false);
	XML.SetAttribute(episode_location_finded_path, "tech_name", project_location_tech_name);
	end
end--if--локация есть в проекте
end--for--перебор локаций из проекта

if episode_location_finded_path == nil then--локацию найти не удалось
	if debugmode == true then Debug.Print("329-ДОБАВЛЯЕМ В ПРОЕКТ: ЛОКАЦИИ "..location_title_new.." НЕТ В ПРОЕКТЕ\r\n"); end
local location_name = "location"..abc.tool.fragment_name_generator();
local location_path = "document/project/locations/"..location_name;
XML.SetValue(location_path, "", false);
local location_title = Crypto.BlowfishEncryptString(location_title_new, global_safety_key, 0);
XML.SetAttribute(location_path, "location_title", location_title);
	if debugmode == true then Debug.Print("333-ДОБАВЛЯЕМ В ЭПИЗОД: ЛОКАЦИИ С НАЗВАНИЕМ "..location_title_new.." НЕТ В ЭПИЗОДЕ\r\n"); end
local locations_count = XML.Count(episode_path, "location");
	if locations_count == -1 then locations_count = 0; end
episode_location_finded_path = episode_path.."/location:"..(locations_count+1);
XML.SetValue(episode_location_finded_path, "", false);
XML.SetAttribute(episode_location_finded_path, "tech_name", location_name);
end

--scene--scene--scene--scene--scene--scene--scene--scene--scene--scene
local_scenes_number = local_scenes_number + 1;
local scene_name = "scene"..abc.tool.fragment_name_generator();
local scene_color = abc.tool.color_generator();
scene_color = Crypto.BlowfishEncryptString(scene_color, global_safety_key, 0);
scene_finded_path = episode_location_finded_path.."/"..scene_name;--по этому адресу сцены будет запись следующих actions characters dialogs
XML.SetValue(scene_finded_path, "", false);
XML.SetAttribute(scene_finded_path, "prefix_text", location_prefix);
XML.SetAttribute(scene_finded_path, "tech_color", scene_color);
XML.SetAttribute(scene_finded_path, "tech_lenght", 0);
	if scene_time_index == nil then scene_time_index = 1; end
XML.SetAttribute(scene_finded_path, "scene_time", scene_time_index);
XML.SetAttribute(scene_finded_path, "tech_pos", (scene_tech_pos_coef*local_scenes_number));
--scene--scene--scene--scene--scene--scene--scene--scene--scene--scene]]

elseif paragraph_style == "Action" then--ивент
if scene_finded_path ~= nil then--если редактирование сцены открыто
local speech_name = "speech"..abc.tool.fragment_name_generator();
XML.SetValue(scene_finded_path.."/"..speech_name, "", false);
XML.SetAttribute(scene_finded_path.."/"..speech_name, "speech_type", "event");
local paragraph_text = XML.GetValue(paragraph_path.."/text");
	if XML.GetAttribute(scene_finded_path, "scene_title") == "" then--заголовок сцены создается из первой Action если ещё пустой
	local scene_title = "["..local_scenes_number.."] "..String.Mid(paragraph_text, 1, 30).." ...";
	scene_title = Crypto.BlowfishEncryptString(scene_title, global_safety_key, 0);
	XML.SetAttribute(scene_finded_path, "scene_title", scene_title);
	end
paragraph_text = Crypto.BlowfishEncryptString(paragraph_text, global_safety_key, 0);
XML.SetAttribute(scene_finded_path.."/"..speech_name, "speech_text", paragraph_text);
local scene_lenght = XML.GetAttribute(scene_finded_path, "tech_lenght");
scene_lenght = String.ToNumber(scene_lenght);
local speech_lenght = String.Length(paragraph_text);
XML.SetAttribute(scene_finded_path, "tech_lenght", (scene_lenght+speech_lenght));
end--if scene_finded_path

elseif paragraph_style == "Character" then--первая часть создания фразы в диалоге
character_finded_name = nil;
speech_finded_path = nil;--закрывается редактирование прошлого диалога
local new_character_name = XML.GetValue(paragraph_path.."/text");--получение текста имени персонажа
new_character_name = String.Replace(new_character_name, "'", "", false);
new_character_name = String.Replace(new_character_name, "\"", "", false);
local voiceover_finded = String.Find(new_character_name, "(", 1, false);
	if voiceover_finded ~= -1 then speech_type = "voiceover";
	new_character_name = String.Mid(new_character_name, 1, (voiceover_finded-1));
	new_character_name = String.TrimRight(new_character_name, nil);
	end
new_character_name = String.TrimRight(new_character_name, nil);

if scene_finded_path ~= nil then--если редактирование сцены открыто
local characters_table = XML.GetElementNames("document/project/characters", false, false);--поиск названия персонажа в проекте по его имени
	if characters_table == nil then characters_table = {}; end
	for character_number, character_name in pairs (characters_table) do
	local character_role = XML.GetAttribute("document/project/characters/"..character_name, "character_role");
	character_role = Crypto.BlowfishDecryptString(character_role, global_safety_key);
		if String.Find(character_role, new_character_name, 1, false) ~= -1 then--если имя нового персонажа совпадает с тем что есть в проекте, используется его название типа character2022020202042374
		character_finded_name = character_name; break
		end--if
	end--for
	if character_finded_name == nil then--если персонажа нет в проекте поэтому его нужно добавить
		if debugmode == true then Debug.Print("417-ДОБАВЛЯЕМ: ПЕРСОНАЖА С ИМЕНЕМ "..new_character_name.." НЕТ В ПРОЕКТЕ\r\n", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1); end
	character_finded_name = "character"..abc.tool.fragment_name_generator();
	XML.SetValue("document/project/characters/"..character_finded_name, "", false);
	local character_role = Crypto.BlowfishEncryptString(new_character_name, global_safety_key, 0);
	XML.SetAttribute("document/project/characters/"..character_finded_name, "character_role", character_role);
	end--if
local speech_name = "speech"..abc.tool.fragment_name_generator();
speech_finded_path = scene_finded_path.."/"..speech_name;
XML.SetValue(speech_finded_path, "", false);
XML.SetAttribute(speech_finded_path, "character_tech_name", character_finded_name);
end--if--редактирование сцены открыто (scene_finded_path)

elseif paragraph_style == "Parenthetical" then--вторая часть создания фразы в диалоге
parenthetical_text = XML.GetValue(paragraph_path.."/text");--получение текста для диалога
	if parenthetical_text ~= "" then parenthetical_text = "("..parenthetical_text..")"; end

elseif paragraph_style == "Dialogue" then--третья часть создания фразы в диалоге
local speech_text = XML.GetValue(paragraph_path.."/text");--получение текста для диалога
	if parenthetical_text ~= nil then
	speech_text = parenthetical_text.."\r\n"..speech_text;
	parenthetical_text = nil;
	end
speech_text = Crypto.BlowfishEncryptString(speech_text, global_safety_key, 0);

if speech_finded_path ~= nil then--сначала создается пустой диалог с персонажем, в этом части этот диалог дополняется тестом
XML.SetAttribute(speech_finded_path, "speech_text", speech_text);
	if speech_type == "voiceover" then
	XML.SetAttribute(speech_finded_path, "speech_type", "voiceover");
	speech_type = nil;
	end
speech_finded_path = nil;--адрес для диалога уже заполнен текстом поэтому удаляется
local scene_lenght = XML.GetAttribute(scene_finded_path, "tech_lenght");
scene_lenght = String.ToNumber(scene_lenght);
local speech_lenght = String.Length(speech_text);
XML.SetAttribute(scene_finded_path, "tech_lenght", (scene_lenght+speech_lenght));

elseif speech_finded_path == nil then--если адреса диалога нет то создается новый пустой диалог и заполняется текстом тут же
if scene_finded_path ~= nil then--редактирование сцены открыто
local speech_name = "speech"..abc.tool.fragment_name_generator();
XML.SetValue(scene_finded_path.."/"..speech_name, "", false);
XML.SetAttribute(scene_finded_path.."/"..speech_name, "character_tech_name", character_finded_name);
XML.SetAttribute(scene_finded_path.."/"..speech_name, "speech_text", speech_text);
	if speech_type == "voiceover" then
	XML.SetAttribute(scene_finded_path.."/"..speech_name, "speech_type", "voiceover");
	speech_type = nil;
	end
local scene_lenght = XML.GetAttribute(scene_finded_path, "tech_lenght");
local speech_lenght = String.Length(speech_text);
XML.SetAttribute(scene_finded_path, "tech_lenght", (scene_lenght+speech_lenght));
end--if--редактирование сцены открыто

end--if--если редактирование диалога открыто
end--if--перебор style basestyle
end--for--перебор всех параграфов

local episode_data = "";
local episode_table = XML.GetElementNames("document/project/episodes/episode", true, true);
	if episode_table == nil then episode_table = {}; end
local location_index = 0; episode_index = 0;
for location_number, location_path in pairs (episode_table) do
location_index = location_index + 1;
	if location_index == 1 then episode_index = (episode_index+1);
	local fragment_name = abc.tool.fragment_name_generator();
	local episode_title = Crypto.BlowfishEncryptString("IMPORT EPISODE PART"..episode_index, global_safety_key, 0);
	local episode_name = Crypto.BlowfishEncryptString("episode"..fragment_name, global_safety_key, 0);
	episode_data = episode_data.."<episode tech_name=\""..episode_name.."\" episode_title=\""..episode_title.."\" episode_description=\"\">"..XML.GetElementXML(location_path);
	elseif location_index == 28 then--локаций на каждый эпизод
	episode_data = episode_data..XML.GetElementXML(location_path).."</episode>";
	location_index = 0;
	else
	episode_data = episode_data..XML.GetElementXML(location_path);
	end
end--for

local data_length = String.Length(episode_data);
local data_ending = String.Mid(episode_data, (data_length-10), -1);
	if data_ending ~= "</episode>" then episode_data = episode_data.."</episode>"; end

local locations_data = XML.GetElementXML("document/project/locations");
locations_data = String.Replace(locations_data, "<locations>", "", false);
locations_data = String.Replace(locations_data, "</locations>", "", false);
local characters_data = XML.GetElementXML("document/project/characters");
characters_data = String.Replace(characters_data, "<characters>", "", false);
characters_data = String.Replace(characters_data, "</characters>", "", false);

XML.SetXML(project_data);
XML.SetValue("root/project/locations/insert", "", false);
XML.InsertXML("root/project/locations/insert", locations_data, 2);
XML.SetValue("root/project/characters/insert", "", false);
XML.InsertXML("root/project/characters/insert", characters_data, 2);
XML.SetValue("root/project/episodes/insert", "", false);
XML.InsertXML("root/project/episodes/insert", episode_data, 2);

episode_location_finded_path = nil;
scene_finded_path = nil;
speech_finded_path = nil;
character_finded_name = nil;

StatusDlg.Hide();
end--function