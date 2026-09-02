extends Control

func _on_button_pressed() -> void:
	print("Yeetus")
	get_tree().change_scene_to_file("res://De Fyra Räknesätten.tscn")
	

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://thingymabob.tscn")
