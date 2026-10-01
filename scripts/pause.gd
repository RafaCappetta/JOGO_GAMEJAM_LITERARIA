extends Control

var pausado = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_continuar_pressed() -> void:
	pausar()

func _on_sair_pressed() -> void:
	get_tree().quit()
	
func pausar():
	if pausado:
		hide()
		Engine.time_scale = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		show()
		Engine.time_scale = 0
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	pausado = !pausado
