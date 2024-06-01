extends Node

@export var currentProject:GeoscribeProject
@export var userSettings:UserSettings

func _ready():	
	userSettings = UserSettings.load_or_create()
	currentProject = GeoscribeProject.new()
	currentProject.timeToOpenProject.connect(_on_time_to_open_project)

func _on_time_to_open_project():
	get_node("/root/MainWindow/Layout/TopBar/WindowTitle").text = "GeOCR - " + self.currentProject.name
