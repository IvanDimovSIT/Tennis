extends Area3D

@export var speed: float = 20.0
var direction: Vector3 = Vector3.ZERO

func start(delay: float, _direction: Vector3) -> void:
	await get_tree().create_timer(delay).timeout
	direction = _direction
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += direction*speed*delta

func _on_hit_player():
	direction.x = -direction.x
	direction.z *= 1.1
	direction = direction.normalized()
	$HitWallSound.play()
	
func _on_hit_wall():
	direction.z = -direction.z
	direction.x *= 1.1
	direction = direction.normalized()
	$HitWallSound.play()
	
func _on_out_of_bounds():
	queue_free()
	#play sound
	pass


