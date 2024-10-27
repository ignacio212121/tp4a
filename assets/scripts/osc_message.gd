extends OSCMessage


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_llamada_1_button_down():
	#target_client.send_message(osc_address, ["ASD"])
	pass

func _on_llamada_1_pressed():
	target_client.send_message(osc_address, ["LLAMADA1"])


func _on_llamada_2_pressed():
	target_client.send_message(osc_address, ["LLAMADA2"])


func _on_llamada_3_pressed():
	target_client.send_message(osc_address, ["LLAMADA3"])


func _on_llamada_4_pressed():
	target_client.send_message(osc_address, ["LLAMADA4"])


func _on_llamada_5_pressed():
	target_client.send_message(osc_address, ["LLAMADA5"])
