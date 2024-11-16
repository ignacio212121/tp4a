extends Node2D

@export var actividad_actual = 0

var color: Color = Color("#0017ec")

var actividad_01: PackedScene = preload("res://scenes/nucleo_03/actividad_01.tscn")
var actividad_02: PackedScene = preload("res://scenes/nucleo_03/actividad_02.tscn")
var actividad_03: PackedScene = preload("res://scenes/nucleo_03/actividad_03.tscn")

var array_actividades: Array

signal nucleo_terminado
signal actividad_finalizada


func _ready():
	array_actividades = [actividad_01.instantiate(), actividad_02.instantiate(), actividad_03.instantiate()]
	actividad_actual -= 1
	$EstadoLlamada.modulate = color
	if actividad_actual == -1:
		$EstadoLlamada.play("atendiendo_llamada")

func _recibiendo():
	$EstadoLlamada.play("recibiendo_pedido")

func _on_estado_llamada_animation_finished():
	actividad_actual += 1
	_recibiendo()

func _on_actividad_terminada():
	$Actividades.remove_child(array_actividades[actividad_actual])
	actividad_actual += 1
	if actividad_actual >= array_actividades.size():
		emit_signal("nucleo_terminado")
	else:
		emit_signal("actividad_finalizada")
		$EstadoLlamada.visible = true
		_recibiendo()

func _actualizar_actividad():
	$EstadoLlamada.visible = false
	$Actividades.add_child(array_actividades[actividad_actual])
	array_actividades[actividad_actual].actividad_terminada.connect(_on_actividad_terminada.bind())
