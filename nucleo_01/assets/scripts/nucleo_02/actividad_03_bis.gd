extends Node2D

signal actividad_terminada
# Called when the node enters the scene tree for the first time.

func _on_boton_s_pressed():
	emit_signal("actividad_terminada")
