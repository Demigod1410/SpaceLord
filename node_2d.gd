extends CharacterBody2D
@export var speed = 600
var can_shoot: bool = true

signal laser(pos)
# Called when the node enters the scene tree for the first time.
func _ready():
	position= Vector2(600,650)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var movement = Input.get_vector("Left", "Right", "Up", "Back")
	velocity = movement * speed
	move_and_slide()
	
	#shooting input.
	if Input.is_action_just_pressed("shoot") and can_shoot: 
		laser.emit($LaserStPos.global_position)
		can_shoot=false
		$LaserTimer.start()
		$LaserSound.play()
 
func play_crash_sound():
	$Explosion.play()

func _on_laser_timer_timeout():
	can_shoot = true
