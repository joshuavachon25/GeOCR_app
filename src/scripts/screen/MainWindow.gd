extends Control

func _ready():
	get_window().min_size = Vector2i(600, 600)
	if OS.get_cmdline_args():
		open_file(OS.get_cmdline_args()[0])
	$OpenProject.set_current_dir(OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP))
	$SaveProject.set_current_dir(OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP))

func open_file(path):
	GeoscribeManager.currentProject.load_project(path)

func _on_open_project_file_selected(path):
	GeoscribeManager.currentProject.load_project(path)
	
func _on_save_project_file_selected(path):
	GeoscribeManager.currentProject.save_project(path)

func _on_project_manager_new_project_popup():
	%SaveProject.visible = true

func _on_project_manager_open_project_popup():
	%OpenProject.visible = true
