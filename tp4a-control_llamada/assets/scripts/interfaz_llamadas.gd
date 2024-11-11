extends Node2D

@export var num_linea: int = 0
@export var num_pantalla: int = 0
@export var llamadas_espera: Array = [0, 0, 0, 0]

signal cambio_linea

func actualizar_linea():
	$LlamadaL.num_linea = num_linea
	$LlamadaL.actualizar_linea()
	for i in $LlamadasEsperando.get_child_count():
		$LlamadasEsperando.get_children()[i].num_linea = llamadas_espera[i]
		$LlamadasEsperando.get_children()[i].actualizar_linea()

func inciar_videos():
	$LlamadaL.iniciar_video()
	for llamada in $LlamadasEsperando.get_children():
		llamada.iniciar_video()


func _on_llamada_clickeado(num_linea):
	emit_signal("cambio_linea", num_linea)

func reiniciar():
	$LlamadaL.reiniciar()
	for llamada in $LlamadasEsperando.get_children():
		llamada.reiniciar()
