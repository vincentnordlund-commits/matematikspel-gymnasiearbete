extends Control

@onready var label: Label = $Label
@onready var line_edit: LineEdit = $LineEdit
@onready var rättsvar: Sprite2D = $FX/Rättsvar
@onready var felsvar: Sprite2D = $FX/felsvar
@onready var progress_bar: TextureProgressBar = $TextureProgressBar

const längd_värden = [
	{"faktor": 1,     "enhet": "m"},
	{"faktor": 0.1,   "enhet": "dm"},
	{"faktor": 0.01,  "enhet": "cm"},
	{"faktor": 0.001, "enhet": "mm"},
	{"faktor": 1000,  "enhet": "km"},
]

const volym_värden = [
	{"faktor": 1,     "enhet": "l"},
	{"faktor": 0.1,   "enhet": "dl"},
	{"faktor": 0.01,  "enhet": "cl"},
	{"faktor": 0.001, "enhet": "ml"},
]

const vikt_värden = [
	{"faktor": 1,     "enhet": "kg"},
	{"faktor": 0.1,   "enhet": "hg"},
	{"faktor": 0.001, "enhet": "g"},
	{"faktor": 1000,  "enhet": "ton"},
]

var rng = RandomNumberGenerator.new()

var fråga: int

var number1: float
var number2: float
var frågor_klarade: int

func _ready() -> void:
	
	_random_fråga()
	line_edit.grab_focus()
	

func _random_fråga() -> void:
	var choices: Array[Callable] = [
		längd,
		vikt,
		volym
	]
	

	
	var chosen_function: Callable = choices.pick_random()
	
	chosen_function.call()
	

var rätt_svar: float

func längd() -> void:
	var enhet: Dictionary
	var enhet2: Dictionary
	
	while true:
		enhet = längd_värden.pick_random()
		enhet2 = längd_värden.pick_random()
		if enhet == enhet2:
			continue
		
		number1 = randi_range(1, 100)
		rätt_svar = number1 * enhet["faktor"] / enhet2["faktor"]
		
		if rätt_svar >= 1 and is_equal_approx(rätt_svar, round(rätt_svar)):
			rätt_svar = round(rätt_svar)
			break
	
	label.text = "Vad blir %d %s i %s?" % [number1, enhet["enhet"], enhet2["enhet"]]

func volym() -> void:
	var enhet: Dictionary
	var enhet2: Dictionary
	
	while true:
		enhet = volym_värden.pick_random()
		enhet2 = volym_värden.pick_random()
		if enhet == enhet2:
			continue
		
		number1 = randi_range(1, 100)
		rätt_svar = number1 * enhet["faktor"] / enhet2["faktor"]
		
		if rätt_svar >= 1 and is_equal_approx(rätt_svar, round(rätt_svar)):
			rätt_svar = round(rätt_svar)
			break
	
	label.text = "Vad blir %d %s i %s?" % [number1, enhet["enhet"], enhet2["enhet"]]
	
func vikt() -> void:
	var enhet: Dictionary
	var enhet2: Dictionary
	
	while true:
		enhet = vikt_värden.pick_random()
		enhet2 = vikt_värden.pick_random()
		if enhet == enhet2:
			continue
		
		number1 = randi_range(1, 100)
		rätt_svar = number1 * enhet["faktor"] / enhet2["faktor"]
		
		if rätt_svar >= 1 and is_equal_approx(rätt_svar, round(rätt_svar)):
			rätt_svar = round(rätt_svar)
			break
	
	label.text = "Vad blir %d %s i %s?" % [number1, enhet["enhet"], enhet2["enhet"]]
	
func _on_line_edit_text_submitted(answer: String) -> void:
	if int(answer) == rätt_svar:
		print("Correct")
		rättsvar.playFXrätt()
	else:
		print("Wrong")
		felsvar.playFXfel()
	
	frågor_klarade += 1
	progress_bar.value = int(frågor_klarade)
	
	if int(frågor_klarade) == 10:
		get_tree().change_scene_to_file("res://Scenes/start.tscn")
	

	line_edit.clear()
	_random_fråga()
