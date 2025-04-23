class_name Player extends CharacterBody2D

var cardinal_dir : Vector2 = Vector2.DOWN
var dir : Vector2 = Vector2.ZERO

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var state_machine : PlayerStateMachine = $StateMachine

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine.Init(self)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dir = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()
	pass

func _physics_process(delta):
	move_and_slide()
	
func UpdateDir() -> bool:
	var new_dir : Vector2 = cardinal_dir
	if dir == Vector2.ZERO:
		return false
	
	if dir.y == 0:
		new_dir = Vector2.LEFT if dir.x < 0 else Vector2.RIGHT
	elif dir.x == 0:
		new_dir = Vector2.UP if dir.y < 0 else Vector2.DOWN
		
	if new_dir == cardinal_dir:
		return false
	
	cardinal_dir = new_dir
	
	sprite.scale.x = -1 if cardinal_dir == Vector2.LEFT else 1
	
	return true
	
func UpdateAnim( state : String ) -> void:
	animation_player.play( state + "_" + GetAnimDir() )
	pass
	
func GetAnimDir() -> String:
	if cardinal_dir == Vector2.DOWN:
		return "down"
	elif cardinal_dir == Vector2.UP:
		return "up"
	else:
		return "side"
