extends KinematicBody2D
#note: all varaibles should be fully UPPERCASE.
#All animations will have first letter Capitalized.
#Input related things will have all lowercase.


const UP = Vector2(0,-1);
export var MAXSPEED = 80
export var GRAVITY =20
export var MAXFALLSPEED = 200
export var JUMPFORCE = 300
export var ACCELERATION= 10
var motion = Vector2()
var facing_right = true;



func _ready():
		pass
		
func _physics_process(delta):
	motion.y+=GRAVITY
	if motion.y>MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if facing_right == true:
		$Sprite.scale.x=1
	else:
		$Sprite.scale.x=-1
		
	#Clamp caps values at a minimum and maximum. This is capping our speed at the max speed value.
	motion.x=clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	#If you move left, you move and face left. big brain
	if Input.is_action_pressed("move_left"):
		motion.x-=ACCELERATION
		facing_right=false
		if (is_on_floor()):
			$AnimationPlayer.play("Moving")
			
			
	#If you move right, you move and face right. big brain
	elif Input.is_action_pressed("move_right"):
		motion.x+=ACCELERATION
		facing_right=true
		if (is_on_floor()):
			$AnimationPlayer.play("Moving")
			

	#Motion decay if you stop moving
	else:
		motion.x = lerp(motion.x,0,0.2)
		#Comment out the two lines below to make his idle animation become T pose.
		if (is_on_floor()):
			#$AnimationPlayer.play("Pre Idle")
			$AnimationPlayer.play("Idle")
	
	#u can only jump if on the floor
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y=-JUMPFORCE
			$AnimationPlayer.play("Jump")
	if !is_on_floor():
		if motion.y>0:
			$AnimationPlayer.play("Falling")
			#$AnimationPlayer.stop("Fallindg")
			if ($AnimationPlayer.current_animation!="Falling"):
				$AnimationPlayer.play("Long Fall")

	motion = move_and_slide(motion,UP)
	
