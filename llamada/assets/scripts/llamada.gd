extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D2.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
