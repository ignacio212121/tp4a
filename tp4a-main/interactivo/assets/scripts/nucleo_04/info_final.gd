extends Node2D

signal actividad_terminada

func _ready() -> void:
	$Info/AnimationPlayer.play("new_animation")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$BotonL.visible = true
	$Titila.visible = true

func _on_boton_l_button_down() -> void:
	emit_signal("actividad_terminada")
