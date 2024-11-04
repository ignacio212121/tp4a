extends Node2D
@onready var viewport = $SubViewport
@onready var brush = viewport.get_node("CanvasLayer/Brush")
@onready var image_top = $Arriba

var dir_resultados = "res://resultados.dat"

var resultados = {
	"totales": 0,
	"opcion_1": 0,
}

var accumulated_texture
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	$SubViewport.size = Vector2(1920, 1080)
	accumulated_texture = ImageTexture.new()
	accumulated_texture.resource_local_to_scene = true

	accumulated_texture.set_image(viewport.get_texture().get_image())
	image_top.material.set_shader_parameter("mask_texture", accumulated_texture)
	_guardar(resultados, dir_resultados)

func _process(delta):
	$Cursor.position.x = get_local_mouse_position().x 
	$Cursor.position.y = get_local_mouse_position().y 
	brush.position = get_local_mouse_position()
	if Input.is_action_pressed("mouse_left"):
		brush.visible = true
		_draw_to_accumulated_texture()
	else:
		brush.visible = false
	if Input.is_action_just_pressed("ui_right"):
		resultados["opcion_1"] += 1
		resultados["totales"] += 1
		_guardar(resultados, dir_resultados)
	if Input.is_action_just_pressed("ui_left"):
		resultados["totales"] += 1
		_guardar(resultados, dir_resultados)
	if Input.is_action_just_pressed("ui_accept"):
		if resultados["totales"] != 0:
			print(resultados["opcion_1"])
			print(resultados["totales"])
			print("Opcion 1: ",resultados["opcion_1"] / resultados["totales"] * 100, "%")
			print("Opcion 2: ", (resultados["totales"] - resultados["opcion_1"]) / resultados["totales"] * 100, "%")
		else:
			print("Opcion 1: 0%")
			print("Opcion 2: 0%")
func _draw_to_accumulated_texture():
	
	var img = viewport.get_texture().get_image()
	accumulated_texture.update(img)
	$SubViewport/CanvasLayer/TextureRect2.texture = accumulated_texture
	
func _guardar(datos, dir):
	var file = FileAccess.open(dir, FileAccess.WRITE)
	file.store_var(datos)
	file = null
	
func _cargar(dir):
	var file = FileAccess.open(dir, FileAccess.READ)
	var data = file.get_var()
	file = null
	return data
