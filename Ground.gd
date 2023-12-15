extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_destination(dest: Vector3):
	print('set destination: '+ str(dest))
	get_parent().set_destination(dest)
