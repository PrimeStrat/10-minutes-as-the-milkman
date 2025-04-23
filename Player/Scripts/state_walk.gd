class_name State_Walk extends State

@export var move_speed : float = 100
@onready var idle : State = $"../Idle"
@onready var attack: State = $"../Attack"

# Player enters new state
func Enter() -> void:
	player.UpdateAnim("move")
	pass
	
# Player exits state
func Exit() -> void:
	pass
	
# Processes state function
func Process( _delta : float) -> State:
	if player.dir == Vector2.ZERO:
		return idle
	
	player.velocity = player.dir * move_speed
	
	if player.UpdateDir():
		player.UpdateAnim("move")
	
	return null
	
func Physics( _delta : float) -> State:
	return null
	
func HandleInput( _event: InputEvent ) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
