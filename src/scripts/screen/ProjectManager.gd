extends Window

signal openProjectPopup
signal newProjectPopup

func _ready():
	print("chat")
	if GeoscribeManager.userSettings.lastProjects.is_empty() or GeoscribeManager.userSettings.lastProjects.size() < 1:
		print("visible")
		%LastProjectsList.add_item("Aucun projet")
		%NoProjectOverlay.visible = true
	else:
		print("invisible")
		%NoProjectOverlay.visible = false
		for project in GeoscribeManager.userSettings.lastProjects:
			%LastProjectsList.add_item(project.name)

func _on_exit_button_pressed():
	get_tree().quit()

func _on_new_project_button_pressed():
	newProjectPopup.emit()

func _on_load_project_button_pressed():
	openProjectPopup.emit()


func _on_last_projects_list_item_selected(index):
	var selected = GeoscribeManager.userSettings.lastProjects[index]
	GeoscribeManager.currentProject.load_project(selected.path)
	self.visible = false
