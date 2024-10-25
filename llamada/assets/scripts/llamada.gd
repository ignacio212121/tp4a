extends Node

@export var nucleo1:PackedScene
@export var nucleo2:PackedScene
@export var nucleo3:PackedScene
@export var nucleo4:PackedScene
@export var nucleo5:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_llamada_1_pressed():
	SceneSwitcher.switch_scene("res://scenes/Nucleo1.tscn")


func _on_llamada_2_pressed():
	SceneSwitcher.switch_scene("res://scenes/Nucleo2.tscn")


func _on_llamada_3_pressed():
	SceneSwitcher.switch_scene("res://scenes/Nucleo3.tscn")


func _on_llamada_4_pressed():
	SceneSwitcher.switch_scene("res://scenes/Nucleo4.tscn")


func _on_llamada_5_pressed():
	SceneSwitcher.switch_scene("res://scenes/Nucleo5.tscn")
