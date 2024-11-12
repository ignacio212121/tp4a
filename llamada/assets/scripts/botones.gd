extends TextureButton

@export var color: Color = Color("#ffffff")
@export var texto: String = "TEXT"

func _ready():
	modulate = color
	$Label.text = texto


func _on_visibility_changed():
	modulate = color
