extends Node

@export var pantalla_actual: int = 0

var iniciar_interactivo: PackedScene = preload("res://scenes/inicio/iniciar_intercativo.tscn")
var video_introductorio: PackedScene = preload("res://scenes/inicio/video_introduccion.tscn")
var instrucciones: PackedScene = preload("res://scenes/inicio/instrucciones.tscn")
var conectar_con_audio: PackedScene = preload("res://scenes/inicio/conectar_audio.tscn")
var elegir_nucleo: PackedScene = preload("res://scenes/inicio/elegir_nucleo.tscn")
var llamada: PackedScene = preload("res://scenes/llamada_l.tscn")
#var encuesta: PackedScene = null

var pantallas: Array

func _input(event):
	if event.is_action_pressed("reiniciar"):
		_reiniciar()

func _reiniciar():
	for pantalla in pantallas:
		if pantalla != null:
			pantalla.queue_free()
			pantalla = null
	pantalla_actual = 0
	_inicializar_pantallas()
	

func _inicializar_pantallas():
	pantallas = [iniciar_interactivo.instantiate(), video_introductorio.instantiate(), instrucciones.instantiate(), conectar_con_audio.instantiate(), elegir_nucleo.instantiate(), llamada.instantiate()]
	$PantallaActual.add_child(pantallas[pantalla_actual])

func _ready():
	_inicializar_pantallas()

func siguiente_pantalla():
	$PantallaActual.remove_child(pantallas[pantalla_actual])
	pantallas[pantalla_actual].queue_free()
	pantallas[pantalla_actual] = null
	pantalla_actual += 1
	$PantallaActual.add_child(pantallas[pantalla_actual])

func cambiar_pantalla(num_pantalla):
	$PantallaActual.remove_child(pantallas[pantalla_actual])
	$PantallaActual.add_child(pantallas[num_pantalla])

func ir_a_llamada(num_linea):
	$PantallaActual.add_child(pantallas[4])
	pantallas[3].visible = false
	pantallas[4].num_linea = num_linea
	pantallas[4].actualizar_linea()
	pantallas[4].iniciar_video()
	
