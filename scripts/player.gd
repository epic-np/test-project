extends CharacterBody2D

const SPEED = 100
var current_dir = "none"


func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	
	# for movement we will use vectors to get 8 directional movement
	# this works because you can add two vectors together to get a new direction up + left = upleft...
	# we have an input vector to be initialized to 0
	var input_vector = Vector2.ZERO
	# our x member will get inputs from right and left directions 
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	# our y member will get inputs from down and up directions
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	# the reason we have get strength is because we need the difference 
	# of these two to make our character face a certain way
	# then we normalize this to be better nubmers? idk for sure you need this tho
	input_vector = input_vector.normalized()
	
	# if we are moving
	if input_vector != Vector2.ZERO:
		# our velocity is now the direction we want to go and the speed (or magnitude to bring physics in)
		velocity = input_vector * SPEED
		# if the absolute val of x > y
		if abs(input_vector.x) > abs(input_vector.y):
			# our current direction is right if x is negative 
			current_dir = "right" if input_vector.x > 0 else "left"
		else:
			# our current direction is down if y is negative 
			current_dir = "down" if input_vector.y > 0 else "up"
		#play_animation(1) we will get to this later but this animadtasion stuff
	else:
		# else we are not moving anymore
		velocity = Vector2.ZERO
		#play_animation(0)
	
	move_and_slide()
