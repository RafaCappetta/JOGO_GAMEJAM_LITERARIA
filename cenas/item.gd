extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func mostrar_label():
	%Label3D.visible = true
	
func ocultar_label():
	%Label3D.visible = false

func foi_pego():
	queue_free()
