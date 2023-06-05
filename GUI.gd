extends Control

var player_score: int = 0
var opponent_score: int = 0
var sound_button_on: bool = true

func _ready():
	$GameHUD.hide()


func write_score() -> void:
	$GameHUD/Score.text = "\nScore: " + str(player_score) + " - " + str(opponent_score)

func update_player_score() -> void:
	opponent_score += 1
	write_score()
	
func update_opponent_score() -> void:
	player_score += 1
	write_score()


func _process(delta):
	pass


func _on_texture_button_pressed():
	if sound_button_on:
		$SoundButton.texture_normal = load("res://assets/soundoff.png")
	else:
		$SoundButton.texture_normal = load("res://assets/soundon.png")
	
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_idx, sound_button_on) 
	
	sound_button_on = not sound_button_on
