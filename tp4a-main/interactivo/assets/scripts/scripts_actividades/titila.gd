extends Sprite2D

@export var color: Color = Color("#ffffff")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("titila")
	modulate = color

func _on_texture_changed() -> void:
	modulate = color

func _on_visibility_changed() -> void:
	modulate = color
