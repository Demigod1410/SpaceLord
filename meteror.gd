extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

signal crash 
var can_crash:=  true

func _ready():
	var rng:= RandomNumberGenerator.new()
	
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-600, -750)
	position = Vector2(random_x,random_y)
	
	
   #speed
	speed = randi_range(500, 700)
	direction_x = rng.randf_range (-1, 1)
	rotation_speed = randi_range(40,100)
	
func _process(delta):
	position += Vector2(direction_x,1.0) * speed * delta
	$Sprite2D.rotation_degrees += rotation_speed * delta

func _on_body_entered(_body):
	if can_crash:
		crash.emit()


func _on_area_entered(area):
	area.queue_free()
	$meteor.play()
	$Sprite2D.hide()
	can_crash = false
	await get_tree().create_timer(1).timeout
	queue_free()
	
