extends Node2D

@export var color: Color = Color("#13DD0F")
@export var actividad_actual = 0

var actividad_01: PackedScene = preload("res://scenes/nucleo_01/actividad_01.tscn")
var actividad_02: PackedScene = preload("res://scenes/nucleo_01/actividad_02.tscn")
var actividad_03: PackedScene = preload("res://scenes/nucleo_01/actividad_03.tscn")
var actividad_04: PackedScene = preload("res://scenes/nucleo_01/actividad_04.tscn")
var info_final: PackedScene = preload("res://scenes/nucleo_01/info_final.tscn")

var array_actividades: Array

signal nucleo_terminado
signal actividad_finalizada

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	array_actividades = [actividad_01.instantiate(), actividad_02.instantiate(), actividad_03.instantiate(), actividad_04.instantiate(), info_final.instantiate()]
	actividad_actual -= 1
	if actividad_actual == -1:
		$Atendiendo.play("atendiendo")

func _recibiendo():
	$Atendiendo.play("recibiendo")
	if actividad_actual == 3:
		$Atendiendo.play("error")
		$Sprite2D.visible = true
		$Sprite2D/Glitch.visible = true
		$Atendiendo.position = Vector2(231,175)
	if actividad_actual == 4:
		$Atendiendo.play("finalizando")

func _on_atendiendo_animation_finished():
	actividad_actual += 1
	_recibiendo()

func _actualizar_actividad():
	$Atendiendo.visible = false
	$Sprite2D/Glitch.visible = false
	$Sprite2D.visible = false
	$Atendiendo.position = Vector2(0, 0)
	$ActividadesUno.add_child(array_actividades[actividad_actual])
	array_actividades[actividad_actual].actividad_terminada.connect(_on_actividad_terminada.bind())

func _on_actividad_terminada():
	$ActividadesUno.remove_child(array_actividades[actividad_actual])
	actividad_actual += 1
	if actividad_actual >= 5:
		emit_signal("nucleo_terminado")
	else:
		emit_signal("actividad_finalizada")
		$Atendiendo.visible = true
		_recibiendo()
