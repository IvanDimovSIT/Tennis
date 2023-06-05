extends CharacterBody3D

signal player_hit

@export var speed: int = 20

@export var max_x: int = 15
@export var min_x: int = -15
@export var max_z: int = 0
@export var min_z: int = -20

func clamp_direction(direction: Vector3) -> Vector3:
	if self.position.x >= max_x:
		direction.x = clamp(direction.x, -1, 0)
	if self.position.x <= min_x:
		direction.x = clamp(direction.x, 0, 1)
	if self.position.z >= max_z:
		direction.z = clamp(direction.z, -1, 0)
	if self.position.z <= min_z:
		direction.z = clamp(direction.z, 0, 1)
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	return direction

func get_movement_direction() -> Vector3:
	var direction: Vector3 = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		direction.x = 1
	if Input.is_action_pressed("move_back"):
		direction.x = -1
	if Input.is_action_pressed("move_left"):
		direction.z = -1
	if Input.is_action_pressed("move_right"):
		direction.z = 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	return clamp_direction(direction)

func _physics_process(delta: float) -> void:
	self.position += get_movement_direction()*speed*delta



func _on_collision_area_entered(area):
	player_hit.emit()
	print_debug("player hit")
	$AnimationPlayer.play("hit")
	#play animation + sound
