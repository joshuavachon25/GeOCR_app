class_name GeoscribeProject extends Resource

signal timeToOpenProject

var version := "1.0"
var name := ""
var api := {
	"openApiToken": "",
	"directusApiToken":"", 
	"directusApiUrl": "",
	"directusApiSchemas": []
}
var pipelines := []
var files := {
		"images": [],
		"data": [],
	}

func load_project(path):
	var GeoscribeReader:= ZIPReader.new()
	var err:= GeoscribeReader.open(path)
	if err != OK:
		return PackedByteArray()
	var res := GeoscribeReader.read_file("config.json")
	json_to_project(bytes_to_var(res))
	#var fileList = GeoscribeReader.get_files()
	#for file in fileList:
	#	res = GeoscribeReader.read_file(file)
	isProjectInRecent(path, name)
	timeToOpenProject.emit()
	GeoscribeReader.close()
	

func save_project(path):
	var GeoscribePacker:= ZIPPacker.new()
	var err := GeoscribePacker.open(path)
	if err != OK:
		return err
	if name == "":
		var tmp_array = path.split('/', false)
		name = tmp_array[tmp_array.size() - 1].replace('.geocr', '')
	GeoscribePacker.start_file("config.json")
	GeoscribePacker.write_file(var_to_bytes(project_to_json(self)))
	GeoscribePacker.close_file()

	GeoscribePacker.close()
	
	isProjectInRecent(path, name)
	
	return OK

func isProjectInRecent(path, name):
	var isInLastProjectList := false
	if GeoscribeManager.userSettings.lastProjects.size() > 0:
		for lastProject in GeoscribeManager.userSettings.lastProjects:
			if lastProject.path == path:
				isInLastProjectList = true
	if !isInLastProjectList:
		GeoscribeManager.userSettings.lastProjects.append({"name": name , "path": path})
		GeoscribeManager.userSettings.save()

func project_to_json(project):
	return {
		"name": name,
		"version": version,
		"api": api,
		"files": files,
		"pipelines": pipelines
	}

func json_to_project(data):
	version = data.version
	name = data.name
	api = data.api
	files = data.files
	pipelines = data.pipelines
