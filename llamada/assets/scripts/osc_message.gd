extends OSCMessage

@export var num_linea: int = 0


func _on_linea_1_clickeado(num_linea: int) -> void:
	if num_linea == 1:
		target_client.send_message(osc_address, ["nucleo_01"])

func _on_linea_2_clickeado(num_linea: int) -> void:
	if num_linea == 2:
		target_client.send_message(osc_address, ["nucleo_02"])

func _on_linea_3_clickeado(num_linea: int) -> void:
	if num_linea == 3:
		target_client.send_message(osc_address, ["nucleo_03"])

func _on_linea_4_clickeado(num_linea: int) -> void:
	if num_linea == 4:
		target_client.send_message(osc_address, ["nucleo_04"])

func _on_linea_5_clickeado(num_linea: int) -> void:
	if num_linea == 5:
		target_client.send_message(osc_address, ["nucleo_05"])

func reiniciar():
	target_client.send_message(osc_address, ["reiniciar"])
