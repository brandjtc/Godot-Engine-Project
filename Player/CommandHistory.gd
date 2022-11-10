extends VBoxContainer


func set_text(useInput: String, response: String):
	$Input.text= ">"+useInput
	$Output.text = response
