extends Node2D

signal actividad_terminada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()
	$Label/AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_animated_sprite_2d_animation_finished() -> void:
	$BarraVacia.visible = true
	$Button.visible = true
	$Label/AnimatedSprite2D.visible = false
	$Label.text = "REVELAR RESULTADO"
	$Titila.visible = true

func _on_button_button_down() -> void:
	$BarraLlena.visible = true
	$BarraVacia.visible = false
	$ImagFinal.visible = true
	$Titila.visible = false
	$Info1/Timer1.start()

func _on_timer_1_timeout() -> void:
	$Info1.visible = true
	$Info2/Timer2.start()
	$Presionar.visible = false

func _on_timer_2_timeout() -> void:
	$Info2.visible = true
	$BotonS.visible = true
	$Titila2.visible = true

func _on_boton_s_button_down() -> void:
	$BarraLlena.visible = false
	$Titila2.visible = false
	$InfoFinal.visible = true
	$BotonS.visible = false

func _on_boton_cerrar_button_down() -> void:
	emit_signal("actividad_terminada")
	print("termina")
