extends Camera3D

var nowshooting = false
var ray_length = 1000
var from
var to

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("click"):
			shoot_ray()

func shoot_ray():
	nowshooting = true
	var mouse_pos = get_parent().get_viewport().get_mouse_position()
	from = project_ray_origin(mouse_pos)
	to = from + project_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	var raycast_result = space.intersect_ray(ray_query)
	nowshooting = false
	print(raycast_result)
	if len(raycast_result) > 0:
		if raycast_result['collider'].has_method("toggle_highlight"):
			raycast_result['collider'].toggle_highlight()
		if raycast_result['collider'].has_method("set_destination"):
			raycast_result['collider'].set_destination(raycast_result['position'])
