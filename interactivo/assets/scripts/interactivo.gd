extends Node

var nucleo_01: PackedScene = preload("res://scenes/nucleo_01/nucleo_01.tscn")
var nucleo_02: PackedScene = preload("res://scenes/nucleo_02/nucleo_02.tscn")
var nucleo_03: PackedScene = preload("res://scenes/nucleo_03/nucleo_03.tscn")
var nucleo_04: PackedScene = preload("res://scenes/nucleo_04/nucleo_04.tscn")
var nucleo_05: PackedScene = preload("res://scenes/nucleo_05/nucleo_05.tscn")

var escenas_nucleos: Array
var instancias_nucleos = [null, null, null, null, null]

@export var nucleo_actual: int = 0

func _ready():
	$Llamada1.play("default")
	$Llamada1.position = Vector2(962.5, 388)
	$Llamada1.scale = Vector2(2.229, 2.09)
	$Llamada1.modulate = Color ("#ff9900")
	$Llamada1.self_modulate = Color("#ff9900")
	$Background.position = Vector2(0, 0)
	escenas_nucleos = [nucleo_01, nucleo_02, nucleo_03, nucleo_04, nucleo_05]
	nucleo_actual -= 1


func cambiar_estado(estado):
	match estado:
		"nucleo_01":
			_cambiar_nucleo(1)
		"nucleo_02":
			_cambiar_nucleo(2)
		"nucleo_03":
			_cambiar_nucleo(3)
		"nucleo_04":
			_cambiar_nucleo(4)
		"nucleo_05":
			_cambiar_nucleo(5)
		"audio_terminado":
			audio_terminado()
		"reiniciar":
			_reiniciar_nucleos()

func _actualizar_nucleo():
	$Llamada1.visible = false
	if instancias_nucleos[nucleo_actual] == null:
		instancias_nucleos[nucleo_actual] = escenas_nucleos[nucleo_actual].instantiate()
		$NucleoActual.add_child(instancias_nucleos[nucleo_actual])
		instancias_nucleos[nucleo_actual].nucleo_terminado.connect(_on_nucleo_terminado.bind())
		instancias_nucleos[nucleo_actual].actividad_finalizada.connect(_on_nucleo_actividad_finalizada.bind())
	else:
		instancias_nucleos[nucleo_actual].visible = true

func _input(event):
	if event.is_action_pressed("ui_accept"):
		audio_terminado()
	if event.is_action_pressed("reiniciar"):
		_reiniciar_nucleos()
	if event.is_action_pressed("nucleo_01"):
		_cambiar_nucleo(1)
	if event.is_action_pressed("nucleo_02"):
		_cambiar_nucleo(2)
	if event.is_action_pressed("nucleo_03"):
		_cambiar_nucleo(3)
	if event.is_action_pressed("nucleo_04"):
		_cambiar_nucleo(4)
	if event.is_action_pressed("nucleo_05"):
		_cambiar_nucleo(5)

func _cambiar_nucleo(num):
	if instancias_nucleos[nucleo_actual] != null:
		instancias_nucleos[nucleo_actual].visible = false
	nucleo_actual = num - 1
	_actualizar_nucleo()

func _reiniciar_nucleos():
	for nucleo in instancias_nucleos:
		if nucleo != null:
			nucleo.queue_free()
		nucleo = null
	$Llamada1.visible = true
	$Llamada1.play("default")


func _on_nucleo_terminado():
	$NucleoActual.remove_child(instancias_nucleos[nucleo_actual])
	instancias_nucleos[nucleo_actual] = null
	$Llamada1.visible = true

func audio_terminado():
	instancias_nucleos[nucleo_actual]._actualizar_actividad()

func _on_nucleo_actividad_finalizada():
	pass
