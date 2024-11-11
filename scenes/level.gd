extends Node2D

@export var asteroid_scene : PackedScene = load('res://scenes/asteroid.tscn')
@export var laser_scene: PackedScene = load('res://scenes/laser.tscn')

var health: int = 3

func _ready() -> void:
	get_tree().call_group('ui', 'set_health', health)

func _on_asteroid_timer_timeout() -> void:
	var asteroid = asteroid_scene.instantiate()
	
	$Asteroids.add_child(asteroid)
	
	asteroid.connect('colision', _on_asteroid_colision)

func _on_asteroid_colision():
	health -= 1
	print('meteor colision in level')
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0: 
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
