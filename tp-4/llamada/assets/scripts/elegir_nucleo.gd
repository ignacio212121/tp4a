extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var llamadas = $Llamadas.get_children()
	for index in $Llamadas.get_child_count():
		llamadas[index].color = GLOBAL.colores[index]
	$Llamadas/LlamadaS.actualizar_linea()
	$Llamadas/LlamadaS.iniciar_video()
	$Llamadas/LlamadaS2.actualizar_linea()
	$Llamadas/LlamadaS2.iniciar_video()
	$Llamadas/LlamadaS3.actualizar_linea()
	$Llamadas/LlamadaS3.iniciar_video()
	$Llamadas/LlamadaS4.actualizar_linea()
	$Llamadas/LlamadaS4.iniciar_video()
	$Llamadas/LlamadaS5.actualizar_linea()
	$Llamadas/LlamadaS5.iniciar_video()

func _on_linea_elegida(num_linea, llamada):
	$Llamadas.remove_child(llamada)
	llamada.queue_free()
	llamada = null
	get_parent().get_parent().ir_a_llamada(num_linea)
	

func detener_llamadas():
	for llamada in $Llamadas.get_children():
		llamada.detener_video()

func iniciar_llamadas():
	for llamada in $Llamadas.get_children():
		llamada.iniciar_video()
