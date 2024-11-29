extends Node2D

signal actividad_terminada

func _ready() -> void:
	$Info01/AnimationPlayer1.play("aparce")
	$Timer.start()

func _on_timer_timeout() -> void:
	$BotonL.visible = true
	$Titila.visible = true

func _on_boton_l_button_down() -> void:
	$Info02/AnimationPlayer2.play("aparece2")
	$Info02.visible = true
	$BotonL.visible = false
	$Titila.visible = false
	$Info01.visible = false
	$Timer2.start()

func _on_timer_2_timeout() -> void:
	$Titila2.visible = true
	$BotonL2.visible = true

func _on_boton_l_2_button_down() -> void:
	emit_signal("actividad_terminada")
