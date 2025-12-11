extends Area2D

@export var player_group: String = "Player"
@export var load_delay: float = 0.5

func _ready():
	# Connect the body_entered signal if not done in editor
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group(player_group) or body.name == "Player":
		handle_reached()

func handle_reached():
	# Optional: play animation or sound
	await get_tree().create_timer(load_delay).timeout
	
	# Logic to load next scene. 
	# In Godot, you need to know the path of the next scene.
	# For now, we'll just print or reload.
	print("EndPoint: Reached! Implement scene loading here.")
	# Example: get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
