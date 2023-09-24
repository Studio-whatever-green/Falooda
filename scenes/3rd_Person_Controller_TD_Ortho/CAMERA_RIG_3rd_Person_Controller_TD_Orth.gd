extends Node3D
@onready var background_viewport = $base_cam/background_viewport_container/background_viewport
@onready var forground_viewport = $base_cam/forground_viewport_container/forground_viewport
@onready var background_camera = $base_cam/background_viewport_container/background_viewport/background_camera
@onready var forground_camera = $base_cam/forground_viewport_container/forground_viewport/forground_camera


# Called when the node enters the scene tree for the first time.
func _ready():
	resize();

func resize():
	background_viewport.size = DisplayServer.window_get_size()
	forground_viewport.size = DisplayServer.window_get_size()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	background_camera.global_transform = FaloodaGameManager.player.camera_point.global_transform
	forground_camera.global_transform = FaloodaGameManager.player.camera_point.global_transform
