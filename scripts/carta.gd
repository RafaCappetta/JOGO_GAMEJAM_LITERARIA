extends StaticBody3D

var olhar_sanidade = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var texto_carta: Array[String] = ["Você encontra um laudo de autopsia no chão.",
											"'Nome: ????????????", "Causa Mortis: Asfixia mecânica, produzida por ação de laço/constrição cervical.",
											"Achados: Lesões internas no pescoço.'"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func mostrar_label():
	%Instrução.visible = true
	
func ocultar_label():
	%Instrução.visible = false
	

func interagir():
	%Instrução.visible = false
	var sistema = get_tree().get_first_node_in_group("SistemaDialogo")
	if sistema == null:
		push_error("Sistema de diálogo não encontrado no grupo 'SistemaDialogo'")
		return
	sistema.inicio_dialogo(texto_carta)
