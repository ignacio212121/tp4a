extends Node

@export var pantalla_actual: int = 0

var iniciar_interactivo: PackedScene = preload("res://scenes/inicio/iniciar_intercativo.tscn")
var video_introductorio: PackedScene = preload("res://scenes/inicio/video_introduccion.tscn")
var instrucciones: PackedScene = preload("res://scenes/inicio/instrucciones.tscn")
var conectar_con_audio: PackedScene = preload("res://scenes/inicio/conectar_audio.tscn")
var elegir_nucleo: PackedScene = preload("res://scenes/inicio/elegir_nucleo.tscn")
var llamada: PackedScene = preload("res://scenes/llamada_l.tscn")

var pantallas: Array
var instancia_llamada = null

var llamadas_finalizadas: int = 0

func _input(event):
	if event.is_action_pressed("reiniciar"):
		_reiniciar()
		$OSCClient/OSCMessage.reiniciar()
	elif event.is_action_pressed("SaltarIntro"):
		_on_llamada_finalizada()

func _reiniciar():
	$LlamadasFinalizadas.visible = false
	llamadas_finalizadas = 0
	for pantalla in pantallas:
		if pantalla != null:
			pantalla.queue_free()
			pantalla = null
	if instancia_llamada != null:
		$Llamada.remove_child(instancia_llamada)
		instancia_llamada.queue_free()
		instancia_llamada = null
	pantalla_actual = 0
	$PantallaActual.visible = true
	_inicializar_pantallas()
	

func _inicializar_pantallas():
	pantallas = [iniciar_interactivo.instantiate(), video_introductorio.instantiate(), instrucciones.instantiate(), conectar_con_audio.instantiate(), elegir_nucleo.instantiate()]
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
	$OSCClient/OSCMessage.seleccionar_nucleo(num_linea)
	instancia_llamada = llamada.instantiate()
	instancia_llamada.color = GLOBAL.colores[num_linea - 1]
	$Llamada.add_child(instancia_llamada)
	#instancia_llamada.llamada_finalizada.connect(_on_llamada_finalizada.bind())
	instancia_llamada.instruccion_terminada.connect(_on_instruccion_finalizada.bind())
	$PantallaActual.visible = false
	pantallas[pantalla_actual].detener_llamadas()
	instancia_llamada.num_linea = num_linea
	instancia_llamada.actualizar_linea(GLOBAL.contenido_llamadas[num_linea - 1])
	
func _on_llamada_finalizada():
	$Llamada.remove_child(instancia_llamada)
	instancia_llamada.queue_free()
	instancia_llamada = null
	pantallas[pantalla_actual].iniciar_llamadas()
	$PantallaActual.visible = true
	llamadas_finalizadas += 1
	if llamadas_finalizadas >= 5:
		$LlamadasFinalizadas.visible = true

func _on_instruccion_finalizada():
	$OSCClient/OSCMessage.instruccion_finalizada()

func _on_osc_receiver_actividad_terminada():
	instancia_llamada.siguiente_actividad()
