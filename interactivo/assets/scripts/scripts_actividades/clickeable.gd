extends Node2D

@export var imagen: CompressedTexture2D
@export var color: Color = Color("#ffffff")
@export var una_vez: bool = true

signal clickeado

func _ready():
	modulate = color
	$Sprite2D.texture = imagen
	$ZonaClickeable/CollisionShape2D.shape.size = $Sprite2D.get_rect().size


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		emit_signal("clickeado")
		if una_vez:
			$ZonaClickeable/CollisionShape2D.call_deferred("set_disabled", true)
