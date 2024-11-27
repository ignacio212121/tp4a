extends Node2D

signal actividad_terminada

func _ready() -> void:
	$Info02/Timer1.start()
	$Info01/AnimationPlayer.play("aparezco")

func _on_timer_1_timeout() -> void:
	$Info02.visible = true
	$Info02/AnimationPlayer.play("aparezco")
	$BotonL/Timer2.start()

func _on_timer_2_timeout():
	$BotonL.visible = true
	$Titila.visible = true

func _on_boton_l_button_down() -> void:
	emit_signal("actividad_terminada")
