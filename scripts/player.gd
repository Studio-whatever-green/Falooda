extends CharacterBody3D

@onready var camera_mount = $camera_mount
@onready var animation_player = $visuals/mixamo_base/AnimationPlayer
@onready var visuals = $visuals


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var sens_horizontal = 0.5 
@export var sens_vertical = 0.5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

# For capturing mouse pointer and moving camera and its mount
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x*sens_horizontal))
		visuals.rotate_y(deg_to_rad(event.relative.x*sens_vertical * 0))
		camera_mount.rotate_x(deg_to_rad(-event.relative.y*sens_vertical))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if animation_player.current_animation != "walking":
			animation_player.play("walking")
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		visuals.look_at(position + direction)
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		if animation_player.current_animation != "idle":
			animation_player.play("idle")

	move_and_slide()

# FOR FUtURE REF
# i have created the basic anim controller
# and i have made the animtion loopable
# and added the node into the script
# so we need to add the animtions when keys are pressed innit
# now we need to point the character in the direction of key pressed
