extends Node2D

signal nucleo_terminado
signal actividad_finalizada


var actividad_actual: int = 0

func _ready() -> void:
	$Inicio.play("atendiendo")

func _on_dibujar_uno_actividad_finalizada() -> void:
	$PromptUno.visible = false
	emit_signal("actividad_finalizada")
	_recibiendo()

func _on_dibujar_dos_actividad_finalizada() -> void:
	$PromptDos.visible = false
	emit_signal("actividad_finalizada")
	_recibiendo()

func _on_dibujar_tres_actividad_finalizada() -> void:
	$PromptTres.visible = false
	$Final.visible = true

func _recibiendo():
	$Inicio.visible = true
	$Inicio.play("recibiendo")

func _actualizar_actividad():
	actividad_actual += 1
	$Inicio.stop()
	$Inicio.visible = false
	match actividad_actual:
		1:
			$PromptUno.visible = true
		2:
			$PromptDos.visible = true
		3: 
			$PromptTres.visible = true

func _on_inicio_animation_finished():
	$BackgroundAnimado.play()
	$BackgroundAnimado.visible = true
	_recibiendo()
	#$PromptUno.visible = true


func _on_boton_s_pressed():
	emit_signal("nucleo_terminado")
