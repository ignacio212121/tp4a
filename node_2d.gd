extends Node2D
@onready var viewport = $SubViewport
@onready var brush = viewport.get_node("CanvasLayer/Brush") # Este es el pincel
@onready var image_top = $Arriba # La imagen superior que queremos hacer transparente

var accumulated_texture
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	$SubViewport.size = Vector2(1920, 1080)
	# Crear una imagen para la textura acumulada que coincida con el tamaño del Viewport
	accumulated_texture = ImageTexture.new()
	accumulated_texture.resource_local_to_scene = true

	accumulated_texture.set_image(viewport.get_texture().get_image())
	# Asignar la textura acumulada al shader de la imagen superior
	image_top.material.set_shader_parameter("mask_texture", accumulated_texture)

func _process(delta):
	# Mover el pincel para que siga la posición del cursor dentro del Viewport
	$Cursor.position.x = get_local_mouse_position().x 
	$Cursor.position.y = get_local_mouse_position().y 
	brush.position = get_local_mouse_position()
	# Dibujar solo si el clic izquierdo está presionado
	if Input.is_action_pressed("mouse_left"):
		brush.visible = true
		_draw_to_accumulated_texture()
	else:
		brush.visible = false

func _draw_to_accumulated_texture():
	
	# Captura el contenido del Viewport en una imagen y acumúlalo en la textura
	var img = viewport.get_texture().get_image()
	accumulated_texture.update(img)
	$SubViewport/CanvasLayer/TextureRect2.texture = accumulated_texture
	
