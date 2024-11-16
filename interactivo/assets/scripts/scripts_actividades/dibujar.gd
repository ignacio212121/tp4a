extends Node2D

signal actividad_finalizada

@export var color: Color = Color("#ffffff")
@export var imagen_arriba: CompressedTexture2D
@export var imagen_abajo: CompressedTexture2D
@export var texto: String = "PLACEHOLDER"

@onready var viewport = $Pantalla/SubViewportContainer/SubViewport
@onready var borrador = $Pantalla/SubViewportContainer/SubViewport/Borrador
@onready var capa_mascara = $Pantalla/SubViewportContainer/SubViewport/Capa
@onready var arriba = $Pantalla/ImagenArriba
@onready var abajo = $Pantalla/ImagenAbajo

var accumulated_texture
var zonas = 0

func _ready():
	$Label.modulate = color
	$Marco.modulate = color
	$Label.text = texto
	$BotonS.color = color
	arriba.texture = imagen_arriba
	abajo.texture = imagen_abajo
	accumulated_texture = ImageTexture.new()
	accumulated_texture.resource_local_to_scene = true
	viewport.handle_input_locally = true
	accumulated_texture.set_image(viewport.get_texture().get_image())
	arriba.material.set_shader_parameter("mask_texture", accumulated_texture)
	$AnimatedSprite2D.play()

func _process(delta):

	borrador.position = viewport.get_mouse_position()
	if Input.is_action_pressed("mouse_left"):
		borrador.visible = true
		_draw_to_accumulated_texture()
		$AnimatedSprite2D.visible = false
	else:
		borrador.visible = false

func _draw_to_accumulated_texture():
	var img = viewport.get_texture().get_image()
	accumulated_texture.update(img)
	capa_mascara.texture = accumulated_texture


func _zona_cumplida():
	zonas += 1
	if zonas == 9:
		arriba.visible = false
		$BotonS.visible = true


func _on_boton_s_pressed():
	emit_signal("actividad_finalizada")

func _on_help_mouse_entered() -> void:
	$Informacion.visible = true

func _on_help_mouse_exited() -> void:
	$Informacion.visible = false
