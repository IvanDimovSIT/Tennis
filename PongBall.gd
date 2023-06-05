extends RigidBody3D

@export var speed: int = 10

func start(delay: float, start_direction: Vector3) -> void:
	await get_tree().create_timer(delay).timeout
	self.linear_velocity = start_direction*speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
