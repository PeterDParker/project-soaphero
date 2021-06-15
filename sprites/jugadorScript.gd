extends KinematicBody2D

const ACCELERATION= 70
const MAX_SPEED= 300
const JUMP_H= -900
const UP= Vector2(0,-1)
const gravity = 40
onready var animaCorre = $correr
onready var sprite = $soap
onready var sprite2 = $saltito
onready var animaSalto = $salto
onready var animaParado = $parado


var motion = Vector2()

func _physics_process(delta):
	#se aplica la gravedad
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		
		
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
	
	
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
	
		friction = true
	 
	if is_on_floor():
		
		#caminar
		if Input.is_action_pressed("ui_right"):
			animaParado.stop()
			animaSalto.stop()
			sprite.flip_h = true
			animaCorre.play("correr")
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		elif Input.is_action_pressed("ui_left"):
			animaSalto.stop()
			animaParado.stop()
			animaCorre.play("correr")
			sprite.flip_h = false
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		else:
			animaCorre.stop()
			animaSalto.stop()
			animaParado.play("parado")
			friction = true
		
		#saltar
	
		if Input.is_action_just_pressed("ui_accept"):
			animaCorre.stop()
			animaParado.stop()
			motion.y = JUMP_H
			animaSalto.play("salto")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		animaSalto.play("salto")
		if friction == true:
			
			motion.x = lerp(motion.x, 0, 0.01)
			
	_dead() 
	
	motion = move_and_slide(motion, UP)

func _ready():
	pass # Replace with function body.

func _golpe_right() -> bool:
	return $RayRight.is_colliding()
	
func _golpe_left() -> bool:
	return $RayLeft.is_colliding()
	
func _dead():
	if _golpe_left() or _golpe_right():
		_dead_personaje()
		
func _dead_personaje():
	hide()
	$CollisionShape2D.disabled = true
	get_tree().change_scene("res")
	
	
	
	
	
	
