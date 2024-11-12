extends Node

var Linea1 = "NombreDelJuego v2.4\n[Sistema] Cargando Chat..."
var Linea2 = "[Sistema] Recibiendo pedido..."
var current_index = 0
var current_line = 1

func _ready() -> void:
	$ChatTexto1.text = ""
	$ChatTexto2.text = ""
	$Timer.start()

func _on_timer_timeout() -> void:
	if current_line == 1:
		if current_index < Linea1.length():
			$ChatTexto1.text += Linea1[current_index]
			current_index += 1
		else:
			current_index = 0
			current_line = 2
	elif current_line == 2:
		if current_index < Linea2.length():
			$ChatTexto2.text += Linea2[current_index]
			current_index += 1
