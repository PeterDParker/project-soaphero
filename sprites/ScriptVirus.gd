extends KinematicBody2D

const ACCELERATION= 70
const MAX_SPEED= 100
const gravity = 40

onready var sprite = $virus
onready var camina = $caminar


var motion := Vector2()

func _ready():
	
	motion.x = MAX_SPEED

func _physics_process(_delta):
	motion.y += gravity
	_move()

	motion = move_and_slide(motion)
	
func _next_to_left_wall() -> bool:
	return $LeftRay.is_colliding()

func _next_to_right_wall() -> bool:
	return $RightRay.is_colliding()

func _floor_detection() -> bool:
	return $virus/floorDetection.is_colliding()

func _flip():
	motion.x *= -1
	$virus.scale.x *= -1

func _move():
	if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection():
		_flip()
	pass

