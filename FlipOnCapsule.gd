extends Area2D

@export var map_root: Node2D
@export var rotation_duration: float = 0.4
@export var smooth: bool = true

var is_rotating: bool = false
var is_90: bool = false

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Check if we hit the player (using Groups is best in Godot)
	if body.is_in_group("Circle") or body.is_in_group("Capsule") or body.name == "Player":
		print("FlipOnCapsule: Triggered by Player/Capsule!")
		try_flip()

func try_flip():
	if is_rotating or map_root == null:
		push_warning("FlipOnCapsule: Can't flip. isRotating=%s, mapRoot=%s" % [is_rotating, map_root])
		return
	rotate_map()

func rotate_map():
	is_rotating = true
	
	var start_angle = map_root.rotation_degrees
	var end_angle = 0.0 if is_90 else 90.0
	
	print("Starting rotation: %s to %s" % [start_angle, end_angle])
	
	if not smooth:
		map_root.rotation_degrees = end_angle
	else:
		var t = 0.0
		while t < rotation_duration:
			t += get_process_delta_time()
			var progress = t / rotation_duration
			# Clamp progress to 1.0
			if progress > 1.0: progress = 1.0
			
			map_root.rotation_degrees = lerp(start_angle, end_angle, progress)
			await get_tree().process_frame
	
	map_root.rotation_degrees = end_angle
	
	is_90 = !is_90
	is_rotating = false
	print("Rotation complete. Now at %s, next will be %s" % [end_angle, (90.0 if is_90 else 0.0)])
