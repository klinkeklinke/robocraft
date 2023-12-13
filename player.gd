extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MAX_SPEED = 400
const acceleration = 300

var destination:Vector3
var moving = false
var speed = 0
var move_direction


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()
	move_to_mouse_cursor(delta)

func toggle_highlight():
	print("toggle_highlight player")
	get_node('highlight').toggle_highlight()
	if get_node('highlight').visible:
		get_parent().set_highlight(self)
	else:
		get_parent().set_highlight(null)

func add_highlight():
	get_node('highlight').visible = true

func remove_highlight():
	get_node('highlight').visible = false

func move_to_position(dest: Vector3):
	destination = dest
	moving = true
	print('player got destination: '+str(dest))
	
func move_to_mouse_cursor(delta):
	if moving == false:
		speed = 0
	else:
		speed += acceleration * delta
		if speed > MAX_SPEED:
			speed = MAX_SPEED
	var movement = position.direction_to(destination) * speed
	
	if position.distance_to(destination) > 1:
		velocity.x = movement.x
		velocity.y = movement.y
		velocity.z = movement.z
		move_and_slide()
	else:
		velocity.x = 0
		velocity.y = 0
		velocity.z = 0
		moving = false
		
	
