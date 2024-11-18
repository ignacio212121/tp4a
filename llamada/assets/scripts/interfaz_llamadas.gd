extends Node2D

@export var num_linea: int = 0
@export var num_pantalla: int = 0
@export var llamadas_espera: Array = [0, 0, 0, 0]

func actualizar_linea():
	$LlamadaL.num_linea = num_linea
	$LlamadaL.actualizar_linea()

func inciar_videos():
	$LlamadaL.iniciar_video()

func reiniciar():
	$LlamadaL.reiniciar()
