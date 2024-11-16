extends Node2D

@export var color: Color = Color ("#ffffff")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ArrastrarAnim.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
