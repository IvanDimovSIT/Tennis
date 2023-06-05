extends Area3D

signal player_net

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	player_net.emit()
	$SoundLose.play()
	pass # Replace with function body.
