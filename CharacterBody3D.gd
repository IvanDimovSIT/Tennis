extends CharacterBody3D

signal player_hit

@export var speed:int = 10
var destination: Vector3 = Vector3.ZERO

func _process(delta):
	if (self.position.x == destination.x and self.position.z == destination.z) or destination == Vector3.ZERO:
		return
	
	var movement: Vector3 = (destination-position)#.normalized()*speed*delta
	movement.y = 0
	
	var delta_location =  movement.normalized()*speed*delta
	
	if delta_location == Vector3.ZERO:
		return
	
	if movement.length() < delta_location.length():
		self.position.x = destination.x
		self.position.z = destination.z
	else:
		self.position += delta_location
	


func _on_collision_area_entered(area):
	player_hit.emit()
	$AnimationPlayer.play("hit")

