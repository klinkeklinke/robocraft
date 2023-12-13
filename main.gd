extends Node3D

var highlight: Node3D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_highlight(node):
	if highlight != null:
		highlight.remove_highlight()
	highlight = node
	print(highlight)

func set_destination(dest: Vector3):
	if highlight is Node3D and highlight.has_method('move_to_position'):
		highlight.move_to_position(dest)
		
