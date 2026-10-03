extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/Main.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()
