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
	$Titila.visible = true
	$Label.text = "REVELAR RESULTADO"

func _on_button_button_down() -> void:
	$BarraLlena.visible = true
	$BarraVacia.visible = false
	$ImagFinal.visible = true
	$Info1/Timer1.start()
	$Presionar.visible = false
	$Titila.visible = false

func _on_timer_1_timeout() -> void:
	$Info1.visible = true
	$Info2/Timer2.start()

func _on_timer_2_timeout() -> void:
	$Info2.visible = true
	$BotonS.visible = true
	$Titila2.visible = true

func _on_boton_s_button_down() -> void:
	emit_signal("actividad_terminada")
