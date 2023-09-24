extends Node2D
@onready var sprite_2d_2 = $Sprite2D2
@onready var label_3 = $Label3

func _ready():
	label_3.hide()
# Called when the node enters the scene tree for the first time.

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/3rd_Person_Controller/3rd_Person_Controller.tscn")
	

func _on_button_pressed_2():
	get_tree().change_scene_to_file("res://scenes/3rd_Person_Controller_TD_Ortho/3rd_Person_Controller_TD_Ortho.tscn")


func _on_button_pressed_3():
	get_tree().change_scene_to_file("res://scenes/tests/camera_tests/camera_tests.tscn")




	
	






func _on_button_button_down():
	label_3.show()


func _on_button_button_up():
	label_3.hide()
