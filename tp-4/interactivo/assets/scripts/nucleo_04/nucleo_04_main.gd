extends Node2D

@export var actividad_actual = 0

var color: Color = Color("#9d08e8")

var actividad_01: PackedScene = preload("res://scenes/nucleo_04/actividad_01.tscn")
var actividad_02: PackedScene = preload("res://scenes/nucleo_04/actividad_02.tscn")
var actividad_03: PackedScene = preload("res://scenes/nucleo_04/actividad_03.tscn")
var actividad_04: PackedScene = preload("res://scenes/nucleo_04/actividad_04.tscn")
var info_final: PackedScene = preload("res://scenes/nucleo_04/info_final.tscn")

var array_actividades: Array

signal nucleo_terminado
signal actividad_finalizada


func _ready() -> void:
	array_actividades = [actividad_01.instantiate(), actividad_02.instantiate(), actividad_03.instantiate(), actividad_04.instantiate(), info_final.instantiate()]
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
