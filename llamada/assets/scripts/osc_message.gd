extends OSCMessage

@export var num_linea: int = 0

func instruccion_finalizada():
	target_client.send_message(osc_address, ["instruccion_finalizada"])

func seleccionar_nucleo(num_nucleo):
	target_client.send_message(osc_address, ["nucleo_seleccionado", num_nucleo])

func reiniciar():
	target_client.send_message(osc_address, ["reiniciar"])
