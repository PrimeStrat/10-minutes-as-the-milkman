class_name State_Idle extends State

@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"

# Player enters new state
func Enter() -> void:
	player.UpdateAnim("idle")
	pass
	
# Player exits state
func Exit() -> void:
	pass
	
# Processes state function
func Process( _delta : float) -> State:
	if player.dir != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null
	
func Physics( _delta : float) -> State:
	return null
	
func HandleInput( _event: InputEvent ) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
