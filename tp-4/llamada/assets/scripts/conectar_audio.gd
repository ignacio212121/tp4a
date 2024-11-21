extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Loading.play()

func _on_conectar_audio_pressed():
	get_parent().get_parent().siguiente_pantalla()
