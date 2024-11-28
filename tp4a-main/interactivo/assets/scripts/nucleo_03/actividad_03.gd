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

func _on_boton_s_pressed() -> void:
	emit_signal("actividad_terminada")
