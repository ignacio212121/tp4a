extends OSCReceiver

signal instruccion_finalizada
signal nucleo_seleccionado
signal reiniciar
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target_server.incoming_messages.has(osc_address):
		var accion = target_server.incoming_messages[osc_address]
		match accion[0]:
			"instruccion_finalizada":
				emit_signal("instruccion_finalizada")
			"nucleo_seleccionado":
				emit_signal("nucleo_seleccionado", accion[1])
			"reiniciar":
				emit_signal("reiniciar")
		target_server.incoming_messages.clear()
