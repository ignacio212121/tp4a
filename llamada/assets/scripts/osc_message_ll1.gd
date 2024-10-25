extends OSCMessage

var scene2 = preload("res://scenes/Nucleo2.tscn")
var scene3 = preload("res://scenes/Nucleo3.tscn")
var scene4 = preload("res://scenes/Nucleo4.tscn")
var scene5 = preload("res://scenes/Nucleo5.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_llamada_2_pressed():
	target_client.send_message(osc_address, ["LLAMADA2"])
	get_tree().change_scene_to_packed(scene2)

func _on_llamada_3_pressed():
	target_client.send_message(osc_address, ["LLAMADA3"])
	get_tree().change_scene_to_packed(scene3)

func _on_llamada_4_pressed():
	target_client.send_message(osc_address, ["LLAMADA4"])
	get_tree().change_scene_to_packed(scene4)

func _on_llamada_5_pressed():
	target_client.send_message(osc_address, ["LLAMADA5"])
	get_tree().change_scene_to_packed(scene5)
