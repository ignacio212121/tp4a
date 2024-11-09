extends Node2D

@export var clave: String = "clave"
@export var imagen: CompressedTexture2D
@export var color: Color = Color("#ffffff")

var arrastrable_dentro: bool = false

var arrastrable: Node2D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = color
	$Sprite2D.texture = imagen
	$Area2D/CollisionShape2D.shape.size = $Sprite2D.get_rect().size


func _on_area_2d_area_entered(area):
	var arrastrable = area.get_parent()
	if arrastrable.clave_objetivo == clave:
		self.arrastrable = arrastrable
		arrastrable_dentro = true
		#arrastrable.llego_zona(position)

func _input(event):
	if event.is_action_released("mouse_left"):
		if arrastrable_dentro:
			arrastrable.llego_zona(position, $Sprite2D.get_rect().size)
			#$Area2D/CollisionShape2D.call_deferred("set_disabled", true)

func _on_area_2d_area_exited(area):
	arrastrable = null
	arrastrable_dentro = false
