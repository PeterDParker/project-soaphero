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
	 
	motion = move_and_slide(motion, UP)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
