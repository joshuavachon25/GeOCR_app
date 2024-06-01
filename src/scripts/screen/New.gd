extends Control

func _ready():
	var x = DirAccess.open("user://")

func _on_new_project_pressed():
	pass # Replace with function body.

func create_save_data():
	var save_dict = {
		"project_name": ""
	}
	
	return save_dict

func save_game():
	var save_file = FileAccess.open("user://save_name.save", FileAccess.WRITE)
	var json_string = JSON.stringify(create_save_data())
	
	save_file.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("user://save_name.save"):
		return
	
	var save_file = FileAccess.open("user://save_name.save", FileAccess.READ)
	
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
