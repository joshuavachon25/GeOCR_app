extends Control

# Node Type
# 1: Output

var DIR = OS.get_executable_path().get_base_dir()
var PATH = ProjectSettings.globalize_path("res://py/venv/Scripts/python")

func _ready():
	pass
	#if !OS.has_feature("standalone"):

func _process(delta):
	if(Input.is_action_just_pressed("ADD_NODE")):
		print("bleu")
		


func _on_graph_edit_connection_request(from_node, from_port, to_node, to_port):
	%Graph.connect_node(from_node, from_port, to_node, to_port)


func _on_graph_disconnection_request(from_node, from_port, to_node, to_port):
	%Graph.disconnect_node(from_node, from_port, to_node, to_port) # Replace with function body.
