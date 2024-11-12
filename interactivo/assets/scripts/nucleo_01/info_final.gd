extends Node2D

signal actividad_terminada

func _on_texture_button_button_down() -> void:
	emit_signal("actividad_terminada")
