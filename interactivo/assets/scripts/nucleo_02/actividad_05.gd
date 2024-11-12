extends Node2D

signal actividad_terminada

func _on_boton_l_pressed():
	emit_signal("actividad_terminada")
