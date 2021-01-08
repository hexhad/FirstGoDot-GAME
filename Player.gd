extends KinematicBody2D

var score : int =0
var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("ready")

func _physics_process(delta):
	
		vel.x = 0
		#movrmrnt inp
		if Input.is_action_pressed("move_left"):
				vel.x -= speed
		if Input.is_action_pressed("move_right"):
				vel.x += speed
		
		#app velocity
		move_and_slide(vel, Vector2.UP)
		
		#gravity
		vel.y += gravity * delta
		
		#jump
		
		if Input.is_action_just_pressed("jump") and is_on_floor():
			vel.y -= jumpForce
		
		#sprite
		if vel.x < 0:
			sprite.flip_h = true
		elif vel.x > 0:
			sprite.flip_h = false
			

