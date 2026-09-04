extends Control

@onready var label: Label = $Label
@onready var line_edit: LineEdit = $LineEdit
@onready var rättsvar: Sprite2D = $FX/Rättsvar

var rng = RandomNumberGenerator.new()

var number1: int
var number2: int

func _ready() -> void:
	
	new_question()
	line_edit.grab_focus()
	

func new_question() -> void:
	
	number1 = int(randi_range(0, 100))
	
	number2 = int(randi_range(0, 100))
	
	label.text = "%d + %d?" % [number1, number2]


# Called when the node enters the scene tree for the first time.


func _on_line_edit_text_submitted(answer: String) -> void:
	if int(answer) == number1 + number2:
		print("Correct")
		rättsvar.playFX1()
	else:
		print("Wrong")

	line_edit.clear()
	new_question()
