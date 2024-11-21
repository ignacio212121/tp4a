extends Node2D

signal actividad_terminada

const TEXTO_LABEL: String = "Tiendas de celulares"
var index: int = 0
var resultado

func _on_timer_timeout():
	if index < TEXTO_LABEL.length():
		$GooglIa/Label.text += TEXTO_LABEL[index]
		index += 1
	else:
		$GooglIa/Label/Timer.stop()
		_mostrar_opciones()

func _on_boton_s_button_down() -> void:
	$GooglIa/Label/Timer.stop()
	$GooglIa/Label.text = TEXTO_LABEL
	_mostrar_opciones()

func _mostrar_opciones():
	$GooglIa/Opciones.visible = true

func _cargar_y_modular():
	$GooglIa/Opciones/Iphone.disabled = true
	$GooglIa/Opciones/Cyber.disabled = true
	$GooglIa/AnimatedSprite2D.visible = true
	$GooglIa/AnimatedSprite2D.play("default")
	$GooglIa/Opciones.modulate = Color("#222222")
	$Presionar.visible = false

func _on_iphone_pressed():
	resultado = $ResultadoPro
	_cargar_y_modular()

func _on_cyber_pressed():
	resultado = $ResultadoCyber
	_cargar_y_modular()

func _on_animated_sprite_2d_animation_finished():
	resultado.visible = true
	$BotonS.visible = true

func _on_boton_s_pressed():
	emit_signal("actividad_terminada")
