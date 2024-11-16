extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()
	$Barra.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_barra_animation_finished() -> void:
	$Barra.visible = false
	$Pasos/Paso1/AnimationPlayer.play("fade")
	$Pasos/Paso1.visible = true

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$Pasos/Paso2.visible = true
	$Pasos/Paso2/AnimationPlayer2.play("fade")

func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	$Pasos/Paso3.visible = true
	$Pasos/Paso3/AnimationPlayer3.play("fade")

func _on_animation_player_3_animation_finished(anim_name: StringName) -> void:
	$Pasos/Paso4.visible = true
	$Pasos/Paso4/AnimationPlayer4.play("fade")

func _on_animation_player_4_animation_finished(anim_name: StringName) -> void:
	$Pasos/Paso5.visible = true
	$Pasos/Paso5/AnimationPlayer5.play("fade")

func _on_animation_player_5_animation_finished(anim_name: StringName) -> void:
	$Pasos/Paso6.visible = true
	$Pasos/Paso6/AnimationPlayer6.play("fade")

func _on_animation_player_6_animation_finished(anim_name: StringName) -> void:
	$Info.visible = true
	$BotonS.visible = true
