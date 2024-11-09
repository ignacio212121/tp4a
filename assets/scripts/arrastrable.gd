extends Node2D

@export var clave_objetivo: String = "clave"
@export var imagen: CompressedTexture2D
@export var color: Color = Color("#ffffff")
var mouse_dentro: bool = false
var posicion_objetivo: Vector2

signal posicionado

func _ready():
	modulate = color
	posicion_objetivo = position
	$Imagen.texture = imagen
	$ZonaClickeable/CollisionShape2D.shape.size = $Imagen.get_rect().size

func _process(delta):
	if mouse_dentro and Input.is_action_pressed("mouse_left"):
		position = get_global_mouse_position()
	else:
		position = posicion_objetivo

func _on_mouse_entered():
	mouse_dentro = true

func _mouse_exited():
	mouse_dentro = false

func llego_zona(posicion, tamanio):
	posicion_objetivo = posicion
	var escala = tamanio / $Imagen.get_rect().size
	$Imagen.scale = escala
	$ZonaClickeable/CollisionShape2D.call_deferred("set_disabled", true)
	emit_signal("posicionado")
	
