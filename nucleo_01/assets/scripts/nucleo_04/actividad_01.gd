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
	$Pasos/Paso1/Timer1.start()

func _on_timer_1_timeout() -> void:
	$Pasos/Paso1.visible = true
	$Pasos/Paso2/Timer2.start()

func _on_timer_2_timeout() -> void:
	$Pasos/Paso2.visible = true
	$Pasos/Paso3/Timer3.start()

func _on_timer_3_timeout() -> void:
	$Pasos/Paso3.visible = true
	$Pasos/Paso4/Timer4.start()

func _on_timer_4_timeout() -> void:
	$Pasos/Paso4.visible = true
	$Pasos/Paso5/Timer5.start()

func _on_timer_5_timeout() -> void:
	$Pasos/Paso5.visible = true
	$Pasos/Paso6/Timer6.start()

func _on_timer_6_timeout() -> void:
	$Pasos/Paso6.visible = true
	$Info.visible = true
	$BotonS.visible = true

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")
