extends Area2D

@export var player_group: String = "Player"
@export var restart_scene: bool = true
@export var restart_delay: float = 0.5

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group(player_group) or body.name == "Player":
		print("Hazard: Player hit the hazard!")
		handle_player_hit()

func handle_player_hit():
	# place for particle/sound effects before restart
	await get_tree().create_timer(restart_delay).timeout
	if restart_scene:
		get_tree().reload_current_scene()
	else:
		print("Hazard: player hit — implement custom Game Over behavior.")
