extends CharacterBody3D


const step_speed = 5.0
const climb_speed = 2

@export var camera : Camera3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	
	camera.position = lerp(camera.position, Vector3(camera.position.x, position.y, camera.position.z), 0.1)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, -input_dir.y, 0)).normalized()
	if direction:
		velocity.y = direction.y * climb_speed
		velocity.z = direction.z * step_speed
	else:
		velocity.y = move_toward(velocity.y, 0, climb_speed)
		velocity.z = move_toward(velocity.z, 0, step_speed)

	move_and_slide()
