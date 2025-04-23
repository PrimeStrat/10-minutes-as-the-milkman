extends CharacterBody2D
var pos : Vector2
var rot : float
var dir : float
var speed = 100

func _ready():
	global_position=pos
	global_rotation=rot
	
func _physics_process( _delta ):
	velocity = Vector2(speed, 0).rotated(dir)
	move_and_slide()
