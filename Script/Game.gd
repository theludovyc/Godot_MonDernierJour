extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const rk_script = "res://Script/Timeline.rk"

@onready var rtl = $RichTextLabel
@onready var reps = [$Asws/Asw0, $Asws/Asw1, $Asws/Asw2, $Asws/Asw3]

func _ready():
	Rakugo.sg_say.connect(_on_say)
	Rakugo.sg_menu.connect(_on_menu)
	
	Rakugo.parse_and_execute_script(rk_script)

func _on_say(_character, text:String):
	prints(text)
	rtl.text = text
	
	Rakugo.do_step()
	
func _on_menu(choices):
	prints(choices)
	var j := 0
	
	for i in choices.size():
		reps[i].visible = true
		reps[i].disabled = false
		reps[i].text = choices[i]
		j += 1
		
	for i in range(j, reps.size()):
		reps[i].visible = false
		reps[i].disabled = true

func _process(_delta):
	if Rakugo.is_waiting_menu_return():
		for i in range(4):
			if reps[i].visible and Input.is_action_just_pressed("asw" + str(i)):
				Rakugo.menu_return(i)

	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	pass

func _on_asw_pressed(index:int):
	Rakugo.menu_return(index)
