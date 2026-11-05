extends Control

@onready var fyra_mellan: TextureButton = $"Spel 1/Fyra_Mellan"
@onready var enheter_mellan: TextureButton = $"Spel 2/Enheter_Mellan"


func _on_spel_1_pressed() -> void:
	if fyra_mellan.visible == false:
		$"Spel 1/Fyra_Mellan".show()
		$"Spel 1/Fyra_Svår".show()
	else:
		$"Spel 1/Fyra_Mellan".hide()
		$"Spel 1/Fyra_Svår".hide()

func _on_spel_2_pressed() -> void:
	if enheter_mellan.visible == false:
		$"Spel 2/Enheter_Mellan".show()
		$"Spel 2/Enheter_Svår".show()
	else:
		$"Spel 2/Enheter_Mellan".hide()
		$"Spel 2/Enheter_Svår".hide()

func _on_fyra_mellan_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/de_fyra_räknesätten_lätt.tscn")
