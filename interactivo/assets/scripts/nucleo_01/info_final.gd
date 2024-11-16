extends Node2D

signal actividad_terminada

func _ready() -> void:
	$Sprite2D/Info02/Timer1.start()
	$Sprite2D/Info01/AnimationPlayer.play("aparezco")

func _on_timer_1_timeout() -> void:
	$Sprite2D/Info02.visible = true
	$Sprite2D/Info02/AnimationPlayer.play("aparezco")
	$Sprite2D/BotonL/Timer2.start()

func _on_timer_2_timeout():
	$Sprite2D/BotonL.visible = true

func _on_boton_l_button_down() -> void:
	emit_signal("actividad_terminada")
