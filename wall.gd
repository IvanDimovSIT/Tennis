extends Area3D

signal wall_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	wall_hit.emit()
	print_debug("wall hit")
	#play sound
	pass # Replace with function body.
