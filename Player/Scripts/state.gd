class_name State extends Node

# Player Reference
static var player: Player

func _ready():
	pass 
	
# Player enters new state
func Enter() -> void:
	pass
	
# Player exits state
func Exit() -> void:
	pass
	
# Processes state function
func Process( _delta : float) -> State:
	return null
	
func Physics( _delta : float) -> State:
	return null
	
func HandleInput( _event: InputEvent ) -> State:
	return null
