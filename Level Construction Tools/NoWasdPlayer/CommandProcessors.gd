extends Node

var DIRECTION = -1

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
		DIRECTION = 2
	return "Moving %s" % second_word
