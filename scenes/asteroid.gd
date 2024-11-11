extends Area2D

var rng = RandomNumberGenerator.new()
var speed: int
var rotation_speed: int
var direction_x: float
var min_speed: int = 200  
var max_speed: int = 300 

signal colision

func _ready():

	var path = "res://Assets/Enviroment/Asteroids/PNGs/Asteroid_" + str(rng.randi_range(1,4)) + ".png"
	$AsteroidImage.texture = load(path)

	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)

	speed = rng.randi_range(min_speed, max_speed)
	
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)

func _process(delta: float) -> void:

	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(_body: Node2D) -> void:
	colision.emit()

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()

#func _on_timer_timeout() -> void:
	# Increase the speed after the timer timeout
	#print('Speed increased!')
	#max_speed += 100
	#min_speed += 100
	#speed = rng.randi_range(min_speed, max_speed)
	#print("New speed: ", speed)
