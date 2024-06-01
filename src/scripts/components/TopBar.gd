extends PanelContainer

var moving := false
var mouse_start: Vector2i

func _ready():
	pass

func _on_minimize_button_pressed():
	get_window().set_mode(Window.MODE_MINIMIZED)

func _on_maximize_button_pressed():
	match get_window().mode:
		Window.MODE_WINDOWED:
			get_window().set_mode(Window.MODE_FULLSCREEN)
		Window.MODE_FULLSCREEN:
			get_window().set_mode(Window.MODE_WINDOWED)

func _on_close_button_pressed():
	get_tree().quit()


func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		if !moving:
			mouse_start = get_viewport().get_mouse_position()
		moving = event.is_pressed()

func _process(_delta):
	if moving:
		var mouse_position := Vector2i(get_viewport().get_mouse_position()) 
		get_window().position += mouse_position - mouse_start

func _on_time_to_open_project():
	$WindowTitle.text = GeoscribeManager.currentProject.name
