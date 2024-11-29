extends Node2D

func _ready() -> void:
	$AudioStreamPlayer.play()

func _on_boton_l_pressed():
	$AudioStreamPlayer.stop()
	get_parent().get_parent().siguiente_pantalla()
