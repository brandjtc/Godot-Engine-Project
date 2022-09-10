extends Area2D

export var speed = 400.0
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	print(screen_size)

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x+=1;
	if Input.is_action_pressed("move_left"):
		direction.x-=1;
	if Input.is_action_pressed("move_up"):
		direction.y-=1;
	if Input.is_action_pressed("move_down"):
		direction.y+=1;
	
	if direction.length()>0:
		direction = direction.normalized()
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	if direction.x != 0:
		$AnimatedSprite.animation="right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = direction.x<0
	elif direction.y!= 0:
		$AnimatedSprite.flip_h=false
		$AnimatedSprite.flip_v=direction.y<0
		$AnimatedSprite.animation="up"
	
		
	position+=direction*speed*delta
	
	
	position.x = clamp(position.x ,0,screen_size.x)
	position.y = clamp(position.y,0,screen_size.y)
	
