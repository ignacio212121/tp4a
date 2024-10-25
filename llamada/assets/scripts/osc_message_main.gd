extends OSCMessage

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
	target_client.send_message(osc_address, ["LLAMADA1"])
	SceneSwitcher.switch_scene("res://scenes/Nucleo1.tscn")


func _on_llamada_2_pressed():
	target_client.send_message(osc_address, ["LLAMADA2"])
	SceneSwitcher.switch_scene("res://scenes/Nucleo2.tscn")


func _on_llamada_3_pressed():
	target_client.send_message(osc_address, ["LLAMADA3"])
	SceneSwitcher.switch_scene("res://scenes/Nucleo3.tscn")


func _on_llamada_4_pressed():
	target_client.send_message(osc_address, ["LLAMADA4"])
	SceneSwitcher.switch_scene("res://scenes/Nucleo4.tscn")


func _on_llamada_5_pressed():
	target_client.send_message(osc_address, ["LLAMADA5"])
	SceneSwitcher.switch_scene("res://scenes/Nucleo5.tscn")
