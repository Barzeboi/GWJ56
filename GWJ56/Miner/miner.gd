extends CharacterBody2D

@export var speed = 75
var last_direction = Vector2.ZERO
@onready var _animated_sprite = $AnimatedSprite2D
	

func _physics_process(delta):
	var input_vector = Vector2(
	Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	velocity = input_vector * speed
	var _input_vector = input_vector.normalized()
	
	if _input_vector.length_squared() > 0:
	# Store the direction for use later when needing
	# to choose the idle animation
	
	# Diagonal movement
		if _input_vector.x != 0 and _input_vector.y != 0:
			
			last_direction = _input_vector
			
			if _input_vector.y > 0:
				if _input_vector.x > 0:
					pass
		elif _input_vector.x != 0:
			if _input_vector.x > 0:
				_animated_sprite.play("move_left")
			else:
				_animated_sprite.play("move_right")
		else:
			if _input_vector.y > 0:
				_animated_sprite.play("move_down")
			else:
				_animated_sprite.play("move_up")
	
	else:
		
		if last_direction.x != 0 and last_direction.y != 0:
			if last_direction.y > 0:
				if last_direction.x > 0:
					pass
					
		elif last_direction.x != 0:
			if last_direction.x > 0:
				_animated_sprite.play("idle_right")
			else:
				_animated_sprite.play("idle_left")
				
		else:
			if last_direction.y > 0:
				_animated_sprite.play("idle_down")
			else:
				_animated_sprite.play("idle_up")
	move_and_slide()

	
