extends Node

var player = Node;

func set_player(player_node):
	player = player_node
func _physics_process(delta):
		if Input.is_action_just_pressed("home"):
			get_tree().change_scene_to_file("res://MAIN.tscn")
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		if Input.is_action_just_pressed("quit"):
			get_tree().quit()
		if Input.is_action_just_pressed("unlock_mouse"):
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
# FPS counter

func _ready():
	preload("res://tools/fps_Counter/fps_counter.tscn")
	
