extends Control

@onready var spel_3: TextureButton = $"Spel 1/Spel 3"

func _on_spel_1_pressed() -> void:
	if spel_3.visible == false:
		$"Spel 1/Spel 3".show()
		$"Spel 1/Spel 4".show()
	else:
		$"Spel 1/Spel 3".hide()
		$"Spel 1/Spel 4".hide()
