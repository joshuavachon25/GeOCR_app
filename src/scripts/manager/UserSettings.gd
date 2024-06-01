class_name UserSettings extends Resource

@export var directus_token = "": 
	set(value):
		directus_token = value
	get:
		return directus_token

@export var directus_url = "": 
	set(value):
		directus_url = value
	get:
		return directus_url

@export var open_api = "":
	set(value):
		open_api = value
	get:
		return open_api

@export_flags("fr", "en") var language = 0:
	set(value):
		language = value
	get:
		return language

@export var basePath := OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP):
	set(value):
		basePath = value
	get:
		return basePath

@export var isEmpty := true:
	set(value):
		isEmpty = value
	get:
		return isEmpty

@export var lastProjects := []:
	set(value):
		lastProjects = value
	get:
		return lastProjects

func save():
	ResourceSaver.save(self, "user://user_settings.tres")

static func load_or_create():
	var res: UserSettings = load("user://user_settings.tres") as UserSettings
	if !res:
		res = UserSettings.new()
	return res
