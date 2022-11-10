extends KinematicBody2D
#note: all varaibles should be fully UPPERCASE.
#All animations will have first letter Capitalized.
#Input related things will have all lowercase.

var fallChecker=false

const UP = Vector2(0,-1);
export var MAXSPEED = 80
export var GRAVITY =20
export var MAXFALLSPEED = 200
export var JUMPFORCE = 300
export var ACCELERATION= 10
var motion = Vector2()
var facing_right = true;


func _ready():
	SCROLLBAR.connect("changed", self, "handle_scrollbar_changed")
	MAX_SCROLL_LENGTH = SCROLLBAR.max_value
	
# warning-ignore:unused_argument
func _physics_process(delta):
	motion.y+=GRAVITY
	if motion.y>MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if facing_right == true:
		$Sprite.scale.x=1
	else:
		$Sprite.scale.x=-1
	
	if (is_on_wall()):
		fallChecker=false
	
	#Clamp caps values at a minimum and maximum. This is capping our speed at the max speed value.
	motion.x=clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	#If you move left, you move and face left. big brain
	if Input.is_action_pressed("move_left") or DIRECTION == 0:
		motion.x-=ACCELERATION
		facing_right=false
		if (is_on_floor()):
			$AnimationPlayer.play("Moving")
			
			
			
	#If you move right, you move and face right. big brain
	elif Input.is_action_pressed("move_right") or DIRECTION == 1:
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
	
	if is_on_floor()&& ONLY_ONCE:
		if Input.is_action_just_pressed("jump") or DIRECTION == 2:
			motion.y=-JUMPFORCE
			$AnimationPlayer.play("Jump")
			$AnimationPlayer.queue("Falling")
			$AnimationPlayer.queue("Long Fall")
			ONLY_ONCE = false
	motion = move_and_slide(motion,UP)



const CommandHistory = preload ("res://Player/CommandHistory.tscn")
export(int) var MAX_LINES_REMEMBERED := 30
onready var HISTORY_ROWS = $"Camera2D/Text Movement/Background/MarginContainer/VBoxContainer/OutputTop/ScrollContainer/TextHistory"
onready var SCROLL = $"Camera2D/Text Movement/Background/MarginContainer/VBoxContainer/OutputTop/ScrollContainer"
onready var SCROLLBAR = SCROLL.get_v_scrollbar()
var MAX_SCROLL_LENGTH=0
var DIRECTION = -1
onready var ONLY_ONCE : bool = true

func _on_Input_text_entered(new_text):
	if new_text.empty():
		return
	var COMMAND_HISTORY = CommandHistory.instance()
	var RESPONSE = process_command(new_text)
	COMMAND_HISTORY.set_text(new_text, RESPONSE)
	HISTORY_ROWS.add_child(COMMAND_HISTORY)
	if HISTORY_ROWS.get_child_count()> MAX_LINES_REMEMBERED:
		var FORGET_EARLIEST = HISTORY_ROWS.get_child_count()-MAX_LINES_REMEMBERED
		for i in range (FORGET_EARLIEST):
			 HISTORY_ROWS.get_child(i).queue_free()

func handle_scrollbar_changed():
	if(MAX_SCROLL_LENGTH != SCROLLBAR.max_value):
		MAX_SCROLL_LENGTH = SCROLLBAR.max_value
		SCROLL.scroll_vertical = MAX_SCROLL_LENGTH 

func process_command(input: String) -> String:
	var WORDS = input.split(" ", false, 0) 
	if WORDS.size()== 0:
		return "Error: No words were parsed"
	var FIRST_WORD = WORDS[0].to_lower()
	var SECOND_WORD = ""
	if WORDS.size() > 1:
		SECOND_WORD = WORDS[1].to_lower()
	match FIRST_WORD:
		"go":
			return go(SECOND_WORD)
		"stop":
			DIRECTION = -1
			return "Stopping"
		"jump":
			DIRECTION = 2
			ONLY_ONCE = true
			return "Jumping"
		_:
			return "Error: Unrecognized command"

func go(second_word: String) -> String:
	if second_word == "":
		return "Go where?"
	if second_word == "left":
		DIRECTION = 0
	elif second_word == "right":
		DIRECTION = 1
	if second_word == "up":
		ONLY_ONCE = true
		DIRECTION = 2
	return "Moving %s" % second_word
