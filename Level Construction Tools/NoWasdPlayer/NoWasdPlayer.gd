extends KinematicBody2D
#note: all varaibles should be fully UPPERCASE.
#All animations will have first letter Capitalized.
#Input related things will have all lowercase.

var playMoveNoise=true;
const UP = Vector2(0,-1);
export var MAXSPEED = 80
export var GRAVITY =20
export var MAXFALLSPEED = 200
export var JUMPFORCE = 400
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
	
	#Clamp caps values at a minimum and maximum. This is capping our speed at the max speed value.
	motion.x=clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	#If you move left, you move and face left. big brain
	if DIRECTION_X == 0:
		motion.x-=ACCELERATION
		facing_right=false
		if (playMoveNoise):
			$Move_Sound.play()
			playMoveNoise=false;
		if (is_on_floor()):
			$AnimationPlayer.play("Moving")
			
			
			
	#If you move right, you move and face right. big brain
	elif DIRECTION_X == 1:
		motion.x+=ACCELERATION
		facing_right=true
		if (playMoveNoise):
			$Move_Sound.play()
			playMoveNoise=false;
		if (is_on_floor()):
			$AnimationPlayer.play("Moving")
		

	#Motion decay if you stop moving
	else:
		motion.x = lerp(motion.x,0,0.2)
		#Comment out the two lines below to make his idle animation become T pose.
		if (is_on_floor()):
			$Move_Sound.stop()
			$AnimationPlayer.play("Idle")
	
	#u can only jump if on the floor
	
	if is_on_floor()&& ONLY_ONCE:
		if DIRECTION_Y == 0:
			if (ONLY_ONCE==true):
				$Thruster.play()
			motion.y=-JUMPFORCE
			$AnimationPlayer.play("Jump")
			$AnimationPlayer.queue("Falling")
			$AnimationPlayer.queue("Long Fall")
			ONLY_ONCE = false
	motion = move_and_slide(motion,UP)



const CommandHistory = preload ("res://Level Construction Tools/NoWasdPlayer/CommandHistory.tscn")
export(int) var MAX_LINES_REMEMBERED := 30
onready var HISTORY_ROWS = $"Camera2D/Text Movement/Background/MarginContainer/VBoxContainer/OutputTop/ScrollContainer/TextHistory"
onready var SCROLL = $"Camera2D/Text Movement/Background/MarginContainer/VBoxContainer/OutputTop/ScrollContainer"
onready var SCROLLBAR = SCROLL.get_v_scrollbar()
var MAX_SCROLL_LENGTH=0
var DIRECTION_X = -1
var DIRECTION_Y = -1
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
	var WORDS = input.split("_", false, 0) 
	if WORDS.size()== 0:
		return "Error: No words\nwere parsed"
	var FIRST_WORD = WORDS[0].to_lower()
	var SECOND_WORD = ""
	if WORDS.size() > 1:
		SECOND_WORD = WORDS[1].to_lower()
	match FIRST_WORD:
		"move":
			return go(SECOND_WORD)
		"stop()":
			DIRECTION_X = -1
			return "Stopping"
		"jump()":
			DIRECTION_Y = 0
			ONLY_ONCE = true
			return "Jumping"
		"help()":
			return "Valid Commands: \nmove_Right(), jump(),\nmove_Left(), stop()"
		_:
			return "Error:\nUnrecognized\ncommand"

func go(second_word: String) -> String:
	if second_word == "":
		return "Move where?"
	if second_word !="right()" && second_word !="left()" && second_word !="up()":
		return "Error:\nUnrecognized\ncommand"
	if second_word == "left()":
		DIRECTION_X = 0
	elif second_word == "right()":
		DIRECTION_X = 1
	if second_word == "_up()":
		ONLY_ONCE = true
		DIRECTION_Y = 0
	second_word=second_word.replace("()","");
	return "Moving %s" % second_word


func _on_Move_Sound_finished():
	playMoveNoise=true;
