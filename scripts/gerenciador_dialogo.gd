extends CanvasLayer

@onready var caixa_dialogo: Control = $Caixa_dialogo
@onready var texto: Label = $Caixa_dialogo/Texto

var linhas_dialogo: Array[String] = []
var Indice_linha_atual: int = 0
var dialogo_ativo: bool = false

func _ready() -> void:
	caixa_dialogo.visible = false

func inicio_dialogo(linhas: Array[String]):
	#pausar jogo ao abrir dialogo
	get_tree().paused = true
	
	linhas_dialogo = linhas
	Indice_linha_atual = 0
	dialogo_ativo = true
	caixa_dialogo.visible = true
	texto.text = linhas_dialogo[Indice_linha_atual]

func _input(event):
	if not dialogo_ativo:
		return
	if event.is_action_pressed("ui_accept"):
		avancar_dialogo()

func avancar_dialogo():
	if Indice_linha_atual < linhas_dialogo.size() - 1:
		Indice_linha_atual += 1
		texto.text = linhas_dialogo[Indice_linha_atual]
	else:
		#Despausar jogo quando fim do dialogo
		get_tree().paused = false
		
		dialogo_ativo = false
		caixa_dialogo.visible = false
