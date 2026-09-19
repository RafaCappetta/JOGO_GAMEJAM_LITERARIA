extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const SENSIBILIDADE = 0.003

@onready var cabeca : Node3D = $"Cabeça"
@onready var camera = $"Cabeça/Camera3D"

var item : Node3D = null

@onready var visao = $"Cabeça/Camera3D/RayCast3D"

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _process(delta: float) -> void:
	checar_colisao_raycast()
	pegar_item()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		cabeca.rotate_y(-event.relative.x * SENSIBILIDADE)
		camera.rotate_x(-event.relative.y * SENSIBILIDADE)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("pular") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("andar_esquerda", "andar_direita", "andar_frente", "andar_tras")
	var direction := (cabeca.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
		
func pegar_item():
	if item != null and Input.is_action_just_pressed("pegar"):
		item.foi_pego()
		item = null
		print("Pegou")
		
func checar_colisao_raycast():
	var colisao = null
	if visao.is_colliding():
		var nova_colisao = visao.get_collider()
		if nova_colisao != null and is_instance_valid(nova_colisao) and nova_colisao.is_in_group("Item"):
			colisao = nova_colisao
			
	if colisao != item:
		if item != null:
			item.ocultar_label()
		item = colisao
		if item != null:
			item.mostrar_label()
