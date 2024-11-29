extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_idea_22_pressed() -> void:
	$Info.visible = true
	$Titila.visible = false
	$Idea33.modulate = Color("#ffffff5d")
	$Idea22.modulate = Color("#ffffff5d")
	$Idea11.modulate = Color("#ffffff5d")
	$Presionar.visible = false
	$Idea22.texture_hover = null
	$Timer.start()

func _on_timer_timeout() -> void:
	$InfoFinal.visible = true
	$Info.modulate = Color("#ffffff5d")
	$Titila2.visible = true
	$BotonS.visible = true
	$Final.visible = true
	aparece()

func aparece():
	if $Final.visible == true:
		$Final/Info01/AnimationPlayer.play("new_animation")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$Final/Info01/Titila.visible = true
	$Final/Info01/BotonL.visible = true

func _on_boton_l_button_down() -> void:
	$Final/Info01.visible = false
	$Final/Info02.visible = true
	$Final/Info02/AnimationPlayer2.play("new_animation1")

func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	$Final/Info02/Titila.visible = true
	$Final/Info02/BotonL2.visible = true

func _on_boton_l_2_button_down() -> void:
	emit_signal("actividad_terminada")
