extends KinematicBody2D

var motion = Vector2()

const SPEED = 100
const MAX_SPEED = 200
const ACCELERATION = 3
const FRICTION = 0.1

func _physics_process(delta):
	if Input.is_action_pressed('ui_right'):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$AnimatedSprite.play("WalkSide")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed('ui_left'):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$AnimatedSprite.play("WalkSide")
		$AnimatedSprite.flip_h = true
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
		
	if Input.is_action_pressed('ui_down'):
		motion.y = min(motion.y + ACCELERATION, MAX_SPEED)
		$AnimatedSprite.play("WalkDown")
	elif Input.is_action_pressed('ui_up'):
		motion.y = max(motion.y - ACCELERATION, -MAX_SPEED)
		$AnimatedSprite.play("WalkUp")
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
	
	motion = move_and_slide(motion)