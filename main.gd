extends Node3D

@export var ball_scene: PackedScene
@export var ball_spawn_time: float = 2.0
var is_game_active: bool = false
var ball

func get_new_ball_direction() -> Vector3:
	var direction: Vector3
	direction.y = 0
	direction.x = randf_range(0.7, 1)
	if randi()%2 == 0:
		direction.x *= -1
	
	direction.z = randf_range(-0.4, 0.4)
	#direction.x = -1
	#direction.z = 0
	
	return direction.normalized()
	
func opponent_to_start() -> void:
	$Opponent.destination = $OpponetStartLocation.position

func opponent_ai() -> void:
	if ball == null or ball.direction.x < 0 or ball.direction == Vector3.ZERO or ball.position.x < -1 or ball.position.x >= 29:
		opponent_to_start()
		return
	
	$Opponent.destination = ball.position
	$Opponent.destination.x = ($OpponetStartLocation.position.x*2 + ball.position.x)/3 
	
func start_round() -> void:
	opponent_to_start()
	ball = ball_scene.instantiate()
	ball.position = $BallSpawnLocation.position
	add_child(ball)
	$Player.player_hit.connect(ball._on_hit_player.bind())
	$Opponent.player_hit.connect(ball._on_hit_player.bind())
	$Terrain/LeftWall.wall_hit.connect(ball._on_hit_wall.bind())
	$Terrain/RightWall.wall_hit.connect(ball._on_hit_wall.bind())
	$PlayerNet.player_net.connect(ball._on_out_of_bounds.bind())
	$OpponentNet.opponent_net.connect(ball._on_out_of_bounds.bind())
	ball.start(ball_spawn_time, get_new_ball_direction())

func _ready() -> void:
	#start_round()
	pass


func _process(delta) -> void:
	if not is_game_active:
		return
		
	if ball == null:
		start_round()
	opponent_ai()
	ball.speed += 0.5*delta
	pass


func _on_start_button_pressed():
	$GUI/TitleScreen.hide()
	$GUI/GameHUD.show()
	is_game_active = true
	$AudioStreamPlayer.play()
	
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit(0)
	pass # Replace with function body.


func _on_back_pressed():
	is_game_active = false
	if ball != null:
		ball.queue_free()
		
	
	ball = null
	$Player.position = $PlayerStartLocation.position
	$Opponent.destination = $OpponetStartLocation.position
	$Opponent.position = $OpponetStartLocation.position
	$GUI.player_score = 0
	$GUI.opponent_score = 0
	$GUI.write_score()
	$GUI/TitleScreen.show()
	$GUI/GameHUD.hide()
	$AudioStreamPlayer.stop()
	pass # Replace with function body.



