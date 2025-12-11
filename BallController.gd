extends RigidBody2D

@export var flip_force: float = 8.0
@export var move_speed: float = 500.0 # Adjusted for Godot pixels (approx 100x Unity units)
@export var roll_torque: float = 5000.0
@export var jump_force: float = 500.0

var is_up: bool = false

func _ready():
	gravity_scale = 1.5
	can_sleep = false

func _integrate_forces(state):
	handle_flip_input(state)
	handle_movement(state)
	handle_jump(state)

func handle_flip_input(state):
	if Input.is_action_just_pressed("flip"):
		is_up = !is_up
		state.linear_velocity.y = 0
		gravity_scale = -1.5 if is_up else 1.5

func handle_movement(state):
	var move = Input.get_axis("move_left", "move_right")
	
	# Set horizontal velocity
	state.linear_velocity.x = move * move_speed
	
	# Add angular velocity for rolling effect (Godot 4 safe)
	state.angular_velocity += (-move * roll_torque) * state.step

func handle_jump(state):
	if gravity_scale > 0 and Input.is_action_just_pressed("jump"):
		state.linear_velocity.y = 0
		state.apply_central_impulse(Vector2.UP * jump_force)
	
	if gravity_scale < 0 and Input.is_action_just_pressed("dive"):
		state.linear_velocity.y = 0
		state.apply_central_impulse(Vector2.DOWN * jump_force)
