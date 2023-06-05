extends Area3D

signal opponent_net
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	opponent_net.emit()
	$SoundWin.play()
	pass # Replace with function body.
