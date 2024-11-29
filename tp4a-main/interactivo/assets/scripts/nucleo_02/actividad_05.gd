extends Node2D

signal actividad_terminada

func _ready() -> void:
	$Info01/AnimationPlayer1.play("new_animation")

func _on_animation_player_1_animation_finished(anim_name: StringName) -> void:
	$Info01/Titila.visible = true
	$Info01/BotonL.visible = true

func _on_boton_l_button_down() -> void:
	$Info01.visible = false
	$Info02.visible = true
	$Info02/AnimationPlayer2.play("new_animation2")

func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	$Info02/Titila.visible = true
	$Info02/BotonL2.visible = true

func _on_boton_l_2_button_down() -> void:
	emit_signal("actividad_terminada")
