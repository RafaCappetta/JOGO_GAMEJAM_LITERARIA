extends StaticBody3D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func mostrar_label():
	%Label3D.visible = true
	
func ocultar_label():
	%Label3D.visible = false

func foi_pego():
	queue_free()

func interagir() -> void:
	foi_pego()
