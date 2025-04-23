class_name State_Attack extends State

var attacking : bool = false

@onready var walk: State = $"../Walk"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var idle = $StateMachine/Idle

var bullet_path = preload("res://projectile.tscn")

# Player enters new state 
func Enter() -> void:
	player.UpdateAnim("attack")
	animation_player.animation_finished.connect(EndAttack)
	attacking = true
	pass
	
# Player exits state
func Exit() -> void:
	pass
	
# Processes state function
func Process( _delta : float) -> State:
	if attacking == false:
		if player.dir == Vector2.ZERO:
			return idle
		else:
			return walk
			
	return null
	
func Physics( _delta : float) -> State:
	player.look_at(player.get_global_mouse_position())
	if Input.is_action_just_pressed("ui_accept"):		
		fire()
	return null
	
func HandleInput( _event: InputEvent ) -> State:
	return null

func EndAttack( _newAnim : String ) -> void:
	attacking = false
	
func fire():
	var bullet = bullet_path.instantiate()
	bullet.dir = player.dir
	bullet.pos = $Node2D.global_position
	bullet.rotation = player.rotation
	get_parent().add_child(bullet)
